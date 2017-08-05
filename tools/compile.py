
import sys, os, subprocess

ARGUMENTS = sys.argv[1:]

# test.py compile --h
# -h, --help, -help, --h {compile|...} = help for action
# -k {keyfilepath} = the path to the keyfile
# -b = binarize configs
# -T {pathTo} = to location
# -F {pathFrom}, -f {files path from (..\*)} = from location
# -I {} = wildcards (seperated by comma (,)) to include while compiling
# -A {path to addon builder} = "
# -S {path to DSUtils} = "
# -p {prefix (variable {folder} available)} = sets the .pbo prefix; {folder} return .pbo folder basename

ARGPARAMS = [
    ["-h", 0],
    ["--help", 0],
    ["-help", 0],
    ["--h", 0],
    ["-k", 1],
    ["-b", 0],
    ["-T", 1],
    ["-F", 1],
    ["-I", 1],
    ["-A", 1],
    ["-S", 1],
    ["-L", 1],
    ["-p", 1]
]
ARGSVALUES = []

AVARGS = []
for arg in ARGPARAMS:
    AVARGS.append(arg[0])

def getArgValue(argument):
    for arg in ARGSVALUES:
        if arg[0] == argument:
            return arg[1:]
    return []

def argInList(argument):
    for arg in ARGSVALUES:
        if arg[0] == argument:
            return True
    return False

for i in range(0, len(ARGUMENTS)):
    if ARGUMENTS[i] in AVARGS:
        args = [
            ARGUMENTS[i]
        ]
        a = ARGPARAMS[AVARGS.index(ARGUMENTS[i])][1]

        if a > 0:
            for b in range(0, a):
                if i + 1 + b >= len(ARGUMENTS):
                    args.append("")
                else:
                    args.append(ARGUMENTS[(i + 1)])   
        ARGSVALUES.append(args)

if argInList("-h") or argInList("--help") or argInList("-help") or argInList("--h"):
    print("LiveInLife build tools help:")
    print("\t-h, --h, -help, --help = help for action")
    print("\t-k {keyfilepath} = the path to the keyfile")
    print("\t-b = binarize configs")
    print("\t-T {pathTo} = to location")
    print("\t-F {pathFrom (use \* at the end to select all folders behind current path)} = from location")
    print("\t-I {} = wildcards (seperated by comma (,)) to include while compiling")
    print("\t-A {path to addon builder} = path of your installed addon builder")
    print("\t-S {path to DSUtils} = path to your installed DSUtils program")
    print("\t-p {prefix (variable {folder} available)} = sets the .pbo prefix; {folder} return .pbo folder basename")
    print("\t-L {path to logfile} = path to the logfile")

    sys.exit(1)

KEYFILE = ""
kVal = getArgValue("-k")
if len(kVal) >= 1:
    KEYFILE = kVal[0]
del kVal

BINARIZE = False
if argInList("-b"):
    BINARIZE = True

PATHTO = ""
pTVal = getArgValue("-T")
if len(pTVal) >= 1:
    PATHTO = pTVal[0]
del pTVal

PATHSFROM = []
pFVal = getArgValue("-F")

if len(pFVal) >= 1:
    p = pFVal[0]
    bN = os.path.basename(p)

    if (bN == "*"):
        p = os.path.dirname(p)
        for folder in os.listdir(p):
            absP = os.path.join(p, folder)
            if os.path.isdir(absP):
                PATHSFROM.append(absP)
    else:
        PATHSFROM.append(p)
del pFVal

INCLUDE = ""
incVal = getArgValue("-I")
if len(incVal) >= 1:
    INCLUDE = incVal[0]
del incVal

PATHADDONBUILDER = ""
pABVal = getArgValue("-A")
if len(pABVal) >= 1:
    PATHADDONBUILDER = pABVal[0]
del pABVal

PATHDSUTILS = ""
pDVal = getArgValue("-S")
if len(pDVal) >= 1:
    PATHDSUTILS = pDVal[0]
del pDVal

PREFIX = ""
pVal = getArgValue("-p")
if len(pVal) >= 1:
    PREFIX = pVal[0]
del pVal

PATHLOGFILE = os.path.join(os.path.dirname(sys.argv[0]), "compile.log")
lVal = getArgValue("-L")
if len(lVal) >= 1:
    PATHLOGFILE = lVal[0]
del lVal

lFile = open(PATHLOGFILE, 'w+')
lFile.truncate()

for path in PATHSFROM:
    fName = os.path.basename(path)
    fPrefixFile = os.path.join(path, "$PREFIX$")
    prefix = PREFIX.replace("{folder}", fName)
    path = os.path.abspath(path)

    if os.path.isfile(fPrefixFile):
        f = open(fPrefixFile)
        prefix = f.readline()
        f.close()

    print(prefix)

    sF = ""
    if KEYFILE != "":
        sF = (' -sign="%s"' % os.path.abspath(KEYFILE))
    
    dSF = ""
    if PATHDSUTILS != "":
        dSF = (' -dssignfile="%s"' % os.path.abspath(PATHDSUTILS))

    inc = ""
    if INCLUDE != "":
        inc = (' -include="%s"' % INCLUDE)

    binar = " -packonly"
    if BINARIZE:
        binar = ""
    
    params = [
        os.path.abspath(PATHADDONBUILDER),
        ('%s' % path),
        ('%s' % os.path.abspath(PATHTO)),
        ('-prefix="%s"' % prefix),
        sF,
        dSF,
        inc,
        "-clear",
        binar
    ]

    strBuf = subprocess.check_output(params, shell=True)
    encStrBuf = strBuf.decode(sys.stdout.encoding)
    print(encStrBuf)
    lFile.write(encStrBuf)
lFile.close()


# test.py compile --h
# -h, --help, -help, --h {compile|...} = help for action
# -k {keyfilepath} = the path to the keyfile
# -b = binarize configs
# -T {pathTo} = to location
# -F {pathFrom} = from location
# -I {} = wildcards (seperated by comma (,)) to include while compiling
# -A {path to addon builder} = "
# -S {path to DSUtils} = "
# -p {prefix (variable {folder} available)} = sets the .pbo prefix; {folder} return .pbo folder basename
# -L {path to logfile} = path to the logfile
