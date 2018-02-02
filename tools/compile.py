
import sys, os, subprocess, shutil, argparse, types, winreg

def getAddonBuilderPath():
    reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)
    path = ""
    f = ""

    try:
        key = winreg.OpenKey(reg, r"SOFTWARE\WOW6432Node\bohemia interactive\addonbuilder")
        path = winreg.QueryValueEx(key, "path")[0]
        f = winreg.QueryValueEx(key, "exe")[0]
        winreg.CloseKey(key)
    except:
        raise Exception("NoTools", "There was no addon builder found on your computer.")

    return os.path.join(path, f)

def getDSCreateKeyPath():
    reg = winreg.ConnectRegistry(None, winreg.HKEY_CURRENT_USER)
    path = ""
    f = ""

    try:
        key = winreg.OpenKey(reg, r"Software\bohemia interactive\dscreatekey")
        path = winreg.QueryValueEx(key, "path")[0]
        f = winreg.QueryValueEx(key, "exe")[0]
    except:
        raise Exception("NoTools", "There was no dssigncreate found on your computer.")

    return os.path.join(path, f)

def getPackagePaths(path):
    bN = os.path.basename(path)
    files = []

    if (bN == "*"):
        p = os.path.dirname(path)
        for folder in os.listdir(p):
            absP = os.path.abspath(os.path.join(p, folder))
            if os.path.isdir(absP):
                files.append(absP)
    else:
        files.append(os.path.abspath(path))

    return files

def getPackagePrefix(path, default):
    path = os.path.join(path, "$PREFIX$")
    if os.path.isfile(path):
        f = open(path)
        tmp = f.readline()
        f.close()
        if tmp != "":
            default = tmp
    return default

def logMsg(logfile, msg):
    if logfile != None:
        logfile.write('%s\n' % msg)

def main():
    parser = argparse.ArgumentParser(description='Build Tool for ArmA 3 packages.')
    parser.add_argument('-k', '--key', type=str, help='path to a key file\nif the key does not exists, a new one will be created')
    parser.add_argument('-b', '--binarize', help='enables binarized configs', action='store_true')
    parser.add_argument('-t', '--pathTo', type=str, help='path to .pbo location')
    parser.add_argument('-f', '--pathFrom', type=str, help='path to .pbo folder or folders marked with \'*\'')
    parser.add_argument('-i', '--include', type=str, help='path to a wildcard exclude file')
    parser.add_argument('-p', '--prefix', type=str, help='adds an prefix to the .pbo\n\'{folder}\' is a keyword for the current package name')
    parser.add_argument('-l', '--logfile', type=str, help='path to a log file')
    parser.add_argument('-n', '--name', type=str, help='file name format\n\'{folder}\' is a keyword containing the package name')
    args = parser.parse_args()

    pathCurrent = os.path.dirname(sys.argv[0])
    pathAddonBuilder = getAddonBuilderPath()
    pathDSCreateKey = getDSCreateKeyPath()

    files = []

    logfile = None
    if args.logfile != "":
        logfile = open(args.logfile, 'w+')
        logfile.write('-> logfile was created')

    if not os.path.isfile(args.key):
        fName = os.path.splitext(os.path.basename(args.key))[0]
        subprocess.check_call('"%s" "%s"' % (pathDSCreateKey, fName))

        if not os.path.exists(os.path.join(os.path.dirname(args.keys), '%s.%s' % (fName, 'bikey'))):
            shutil.move(os.path.join(pathCurrent, '%s.%s' % (fName, 'bikey')),
                        os.path.dirname(args.key))
        if not os.path.exists(args.keys):
            shutil.move(os.path.join(pathCurrent, '%s.%s' % (fName, 'biprivatekey')),
                        os.path.dirname(args.key))

    for path in getPackagePaths(args.pathFrom):
        fileName = os.path.basename(path)
        prefix = getPackagePrefix(path, args.prefix)
        prefix = prefix.replace('{folder}', fileName)
        packageName = args.name
        packageName = packageName.replace('{folder}', fileName)

        print('-> compiling next package %s' % packageName)
        logMsg(logfile, '-> compiling next package %s' % packageName)

        command = [
            '"%s"' % pathAddonBuilder,
            '"%s"' % path,
            '"%s"' % os.path.abspath(args.pathTo)
        ]

        if prefix != "":
            command.append('-prefix="%s"' % prefix)

        if args.key != "":
            command.append('-sign="%s"' % args.key)

        if args.include != "" and os.path.isfile(args.include):
            command.append('-include="%s"' % args.include)

        if not args.binarize:
            command.append('-packonly')

        command.append('-clear')
        command = " ".join(command)

        logBuffer = subprocess.check_output(command)
        logMsg(logfile, logBuffer.decode(sys.stdout.encoding))

    logfile.close()
    return 0

if __name__ == '__main__':
    sys.exit(main())
