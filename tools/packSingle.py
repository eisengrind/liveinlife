
import os, sys, subprocess

_config_addonBuilder = "D:/Program Files/Steam/steamapps/common/Arma 3 Tools/AddonBuilder/AddonBuilder.exe"
_config_includeFile = "D:/Users/agphe/Documents/GitHub/private/LiveInLife/LiveInLifeClient/include.txt"
_config_packlog = "D:/Users/agphe/Documents/GitHub/private/LiveInLife/LiveInLifeServer/packlog.log"
_config_signPath = "D:/Program Files/Steam/steamapps/common/Arma 3 Tools/DSSignFile"
_config_signFile = "lil0.8.7.biprivatekey"
_config_signFileVersion = "lil0.8.7"
_signFilePath = os.path.join(_config_signPath, _config_signFile)

def exit(_status=0):
    sys.exit(_status)

_argument_directory = sys.argv[1]
_argument_pathTo = sys.argv[2]

if not os.path.isdir(_argument_directory):
    print("Target directory is not valid!")
    exit(0)

if not os.path.isdir(_argument_pathTo):
    print("Drop directory is not valid!")
    exit(0)

logFile = open(_config_packlog, 'a')

_argument_directoryName = os.path.basename(_argument_directory)

for fileOrDir in _argument_pathTo:
    if os.path.isfile(os.path.join(_argument_pathTo, fileOrDir)) and _argument_directoryName in fileOrDir:
        os.remove(os.path.join(_argument_pathTo, _argument_directoryName))

_prefix = _argument_directoryName.split("_", 1)
_result = subprocess.check_output(('%s "%s" "%s" -prefix="x\%s\\addons\%s" -sign="%s" -include="%s" -clear' %
    (_config_addonBuilder, _argument_directory, _argument_pathTo, _prefix[0], _prefix[1], _signFilePath, _config_includeFile)))
print(_result.decode(sys.stdout.encoding))
logFile.write(_result.decode(sys.stdout.encoding))
logFile.close()
