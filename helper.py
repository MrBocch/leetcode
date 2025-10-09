import os
from datetime import date
import pyperclip as pc

# there is an issue where, in the github code
# the code shows up without any newlines
# how annoying 
# when does this problem occur?
# and why?
# https://stackoverflow.com/questions/60846450/github-why-does-my-python-code-have-m-and-no-new-lines
# https://blog.boot.dev/clean-code/line-breaks-vs-code-lf-vs-crlf/
# i hate windows
 
def getSol():
    sol = pc.paste()
    sol = sol.replace('\r\n', '\n')
    return sol

def pushToGit():
    print("pulling changes in repo")
    print(os.system("git pull"))
    print(os.system("git status"))
    os.system("git add .")
    m = input("commit msg> ")
    os.system(f'git commit -m "{m}"')
    os.system("git push")

def solvedNew():
    n      = input("Problem number: ")
    name   = input("Problem name (PascalCase): ")
    folder = f"src/{n}_{name}"

    print("Folder created "+ folder)
    os.mkdir(folder)

    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension .")
    sol = getSol()

    with open(f"{folder}/{n}.{ext}", "w") as f:
        f.write(sol)
    
    # also create notes
    with open(f"{folder}/notes.txt", "w") as f:
        today = str(date.today()) + "\n"
        f.write(today)

# what if already solved but with a different language?
def oldNewLang():
    n = input("What problem number: ")
    dirlist = os.listdir("src")
    folder = ""
    fnum = ""

    # O(n) is faster than sorting list then using binary search
    os.chdir("src")
    for d in dirlist:
        
        if os.path.isdir(d) and not d[0] == ".":
            fsplit = d.split("_")
            fnum = fsplit[0]
            fname = fsplit[1]
            if fnum == n:
                folder = f"src/{fnum}_{fname}"
                break

    if folder == "":
        print("Problem not found")
        return
    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension .")
    sol = getSol()
    
    # should probably check to make sure there is not 
    # already, a file with same name before creating file
    # but im assuming I remember if i did so or not, (should probaby fix tis)

    opt = input("if already done with the same language before, or want add description? (y/n): ")
    if opt == "y":
        des = input(f"Enter description {fnum}_")
        with open(f"{folder}/{fnum}_{des}.{ext}", "w") as f:
            f.write(sol)
    elif opt == "n":
        with open(f"{folder}/{fnum}.{ext}", "w") as f:
            f.write(sol)
    else:
        print("type correctly")

    os.chdir("..")

banner = '''
====================
= LEETCODE MANAGER =
====================
'''

stay = True 
print(banner)
while stay:
    print("(1). Solved a new problem")
    print("(2). Solved a old problem in diff new lang")
    print("(3). Push to github")
    print("(4). Exit")
    op = int(input("> "))
    if op == 4:
        stay = False 
    
    if op == 1:
        solvedNew()

    if op == 2:
        oldNewLang()

    if op == 3:
        pushToGit()
