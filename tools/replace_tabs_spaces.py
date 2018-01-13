#!/usr/bin/env python3

import fnmatch
import os
import sys

def replace_tabs_with_spaces(file):
    tabSign = "\t"
    spaceSign = "    "

    with open(file) as f:
        s = f.read()
        if tabSign not in s:
            return False

    with open(file, 'w') as f:
        s = s.replace(tabSign, spaceSign)
        f.write(s)

    return True

def main():
    repList = []

    lilcRootDir = "../@LiveInLifeClient"
    if (os.path.exists("@LiveInLifeClient/addons")):
        lilcRootDir = "@LiveInLifeClient/addons"

    lilsRootDir = "../@LiveInLifeServer"
    if (os.path.exists("@LiveInLifeServer/addons")):
        lilsRootDir = "@LiveInLifeServer/addons"

    for root, dirnames, filenames in os.walk(lilcRootDir):
        for filename in fnmatch.filter(filenames, '*.sqf'):
            repList.append(os.path.join(root, filename))
        for filename in fnmatch.filter(filenames, '*.cpp'):
            repList.append(os.path.join(root, filename))
        for filename in fnmatch.filter(filenames, '*.hpp'):
            repList.append(os.path.join(root, filename))

    for root, dirnames, filenames in os.walk(lilsRootDir):
        for filename in fnmatch.filter(filenames, '*.sqf'):
            repList.append(os.path.join(root, filename))
        for filename in fnmatch.filter(filenames, '*.cpp'):
            repList.append(os.path.join(root, filename))
        for filename in fnmatch.filter(filenames, '*.hpp'):
            repList.append(os.path.join(root, filename))

    for file in repList:
        if replace_tabs_with_spaces(file):
            print("replacing tabs for " + file)

    return 0

if __name__ == "__main__":
    sys.exit(main())
