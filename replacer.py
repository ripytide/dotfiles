#! /bin/python3
import toml
import sys
import shutil

# arg 1 = where to find replacements toml file
# arg 2 = where to find files to act the replacements on

replacementsFile = sys.argv[1]
configFiles = sys.argv[2]

def replaceInFile(filename, replacements):
    # read file to array of strings
    with open(getConfigFilePath(filename), "r") as file:
        lines = file.readlines()

    # write strings back to file but replace variables with replacements
    with open(getConfigFilePath(filename), "w") as file:
        for line in lines:

            if line[0] == "!":
                print("filename:" + filename)

                #start at 1 to ignore the ! and end
                #at -1 to ignore the \n at the end of the line
                variable_name = line[1:-1] 

                print("KEY = " + variable_name)
                line = replacements[variable_name]
            
            file.write(line)
        
def getConfigFilePath(filename):
    return configFiles + "/" + filename

parsed_replacements = toml.load(replacementsFile)

for key in parsed_replacements:
    replaceInFile(key, parsed_replacements[key])
