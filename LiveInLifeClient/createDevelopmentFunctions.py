
import sys, os

functionsPath = sys.argv[1]
outputFilePath = sys.argv[2]

availableFunctions = [];

def getAllTags(curPath):
    tags = []
    for fileOrDir in os.listdir(curPath):
        if os.path.isdir(os.path.join(curPath, fileOrDir)):
            tags.append(os.path.basename(os.path.join(curPath, fileOrDir)))
    return tags

tags = getAllTags(functionsPath)

def listItemEqualsString(list, string):
    for item in list:
        if item in string:
            return item
    return ""

def getAllFunctions(curPath):
    functions = []

    for fileOrDir in os.listdir(curPath):
        if os.path.isdir(os.path.join(curPath, fileOrDir)):
            functions = functions + getAllFunctions(os.path.join(curPath, fileOrDir))
        elif os.path.isfile(os.path.join(curPath, fileOrDir)):
            itemResult = listItemEqualsString(tags, curPath)
            if "functions" in os.path.dirname((os.path.join(curPath, os.pardir))) and itemResult != "":
                functionName = os.path.basename(fileOrDir)
                if functionName[:3] == "fn_" and str(os.path.join(curPath, fileOrDir)).endswith("sqf"):
                    functionName = functionName[3:]
                    functionName = functionName[:-4]

                    functions.append(
                        [
                            itemResult,
                            functionName,
                            os.path.join(curPath, fileOrDir)
                        ]
                    )
    return functions

outputFile = open(outputFilePath, 'w+')
for function in getAllFunctions(functionsPath):
    print(function)
    selectedFile = open(function[2], 'r')
    fileContent = selectedFile.read()
    selectedFile.close()
    outputFile.write(function[0] + '_fnc_' + function[1] + ' = {\n' + fileContent + '\n};\n\n')
outputFile.close()

#Folders:
#    lilc_1
#        functions
#            icons
#                fn_findIcon.sqf
#            fn_someSomething.sqf
#    lilc_2
#        functions
#            fn_someText.sqf
#    lilc_3
#        functions
#            ui
#                fn_testFile.sqf
