
import os, sys, subprocess

_config_addonBuilder = "D:/Programs/Steam/steamapps/common/Arma 3 Tools/AddonBuilder/AddonBuilder.exe"
_config_includeFile = "D:/Windows 10 Benutzer/agphe/Documents/GitHub/LiveInLife/LiveInLifeClient/include.txt"
_config_packlog = "D:/Windows 10 Benutzer/agphe/Documents/GitHub/LiveInLife/LiveInLifeServer/packlog.log"
_config_signPath = "D:/Programs/Steam/steamapps/common/Arma 3 Tools/DSSignFile"
_config_signFile = "lilc0.7.biprivatekey"
_signFilePath = os.path.join(_config_signPath, _config_signFile)

_argument_pathFrom = sys.argv[1]
_argument_pathTo = sys.argv[2]

logFile = open(_config_packlog, 'w+')
logFile.truncate()
logFile.close()

for directory in os.listdir(_argument_pathTo):
    directoryPath = os.path.join(_argument_pathTo, directory)
    
    if os.path.isfile(directoryPath):
        if "lilc_" in directory:
            logFile = open(_config_packlog, 'a')
            if os.access(directoryPath, os.R_OK):
                os.remove(directoryPath)
                logFile.write('removing file: %s\n' % (directory))
            else:
                logFile.write('no access to file: %s\n' % (directory))
            logFile.close()

for directory in os.listdir(_argument_pathFrom):
    directoryPath = os.path.join(_argument_pathFrom, directory)
    
    if os.path.isdir(directoryPath):
        if os.access(directoryPath, os.R_OK):
            #_result = subprocess.check_output(('%s "%s" "%s" -prefix="x\%s\\addons\%s" -sign="%s" -include="%s" -clear' % (_config_addonBuilder, directoryPath, _argument_pathTo, _prefix[0], _prefix[1], _signFilePath, _config_includeFile)))
            subprocess.check_output('python "D:/Users/agphe/Documents/GitHub/private/LiveInLife/LiveInLifeServer/packSingle.py" "%s" "%s"' % (directoryPath, _argument_pathTo));
