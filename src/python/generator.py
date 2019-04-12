import os
import time
import datetime


def debugFile(path, fileTree, fileOrder, config):
    filePath = "%s/debug.lua" % (path)
    f = open(filePath, 'w+')
    f.write("--[[\n\tThis file was automatically generated with build.py\n"
            "\tChanges made in this file are NOT saved.\n]]\n\n")
    f.write("tfm = require \"include.transformice\" -- Local Debug Framework\n")
    f.write("ui = tfm.ui\nsystem = tfm.system\n")
    missingFiles = list(set(fileTree) - set(fileOrder))
    tree = [file for file in fileOrder if file in fileTree]
    f.write(strComment("Module file tree"))
    for file in tree:
        if file:
            string = "require \"%s\"\n" % (file)
            f.write(string)
    for file in missingFiles:
            string = "require \"%s\" -- (X)\n" % (file)
            f.write(string)
    f.write(strComment("Debug framework config"))
    f.write("tfm.get.room.name = \"*#pokelua00test\"\n")
    f.write(strComment("Initialize the module."))
    f.write("init()")
    f.close()


def moduleFile(path, fileTree, fileOrder, srcPath, config):
    filePath = "%s/module.lua" % (path)
    f = open(filePath, "w+")
    f.write(strComment("This file was automatically generated by build.py"
        "\n\tChanges made to this file are NOT saved.", True))
    tree = [file for file in fileOrder if file in fileTree]
    for file in tree:
        filePath = "%s\%s.lua" % (srcPath, file.replace(".", "\\"))
        new_file = parseFile(filePath)
        new_file = new_file.replace('&version&', time.strftime("%d.%m.%y"))
        f.write(new_file)
    f.write("\ninit()")
    f.close()


def listFile(path):
    listPath = "%s\\include\\lists" % (path)
    listFilePath = "{}\include\\list.lua".format(path)
    # filePath = "%s\\src\\lua\\list.lua" % (listPath)
    listF = open(listFilePath, "w+")
    for path, subdirs, files in os.walk(listPath):
        for file in files:
            filePath = "{}\{}".format(listPath, file)
            f = parseFile(filePath)
            #listF.write(f.rstrip("\n").replace(" ", "").replace("\n", ""))
            listF.write(f)
    listF.close()


def parseFile(filePath):
    f = open(filePath, 'r')
    file = stripComments(f.read())
    if "/data" in filePath:
        file = file.replace('\n', '\t')
    f.close()
    return file


def stripComments(source):
    content = source.split('\n')
    multiComment = False
    newSource = []
    for line in content:
        if line.startswith("--[["):
            multiComment = True
            pass
        elif line.startswith("]]"):
            multiComment = False
            pass
        elif line.startswith("--"):
            pass
        elif line.startswith("\t\t\t\t--"):
            pass
        else:
            if not multiComment:
                newSource.append("%s\n" % line)
    return " ".join(newSource)


def strComment(text, header=False):
    if header:
        return "--[[ \n\t%s\n ]]\n" % text
    else:
        return "\n--[[ \n\t%s\n ]]\n" % text
