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
    print(os.system("git status"))
    os.system("git add .")
    m = input("commit msg> ")
    os.system(f"git commit -m \"{m}\"")
    os.system("git push")

def solvedNew():
    n     = input("Problem number: ")
    name  = input("Problem name (PascalCase): ")
    fname = f"{n}_{name}"

    print("Folder created "+ fname)
    os.mkdir(fname)

    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension .")
    sol = getSol()

    with open(f"{fname}/{n}.{ext}", "w") as f:
        f.write(sol)
    
    # also create notes
    with open(f"{fname}/notes.txt", "w") as f:
        today = str(date.today()) + "\n"
        f.write(today)

    print("Do you have other solutions? (y/n) ")
    nsol = input("> ")
    while nsol == "y":
        print("Make sure to have solution in clipboard b4 type extension")
        ext = input("extension .")
        sol = getSol()      
        with open(f"{fname}/{n}.{ext}", "w") as f:
            f.write(sol)

        print("Do you have other solutions? (y/n) ")
        nsol = input("> ")

# what if already solved but with a different language?
def oldNewLang():
    n = input("What problem number: ")
    dirlist = os.listdir(".")
    folder = ""
    fnum = ""

    for d in dirlist:
        if os.path.isdir(d) and not d ==".git":
            fsplit = d.split("_")
            fnum = fsplit[0]
            fname = fsplit[1]
            if fnum == n:
                folder = f"{fnum}_{fname}"
                break

    if folder == "":
        print("Problem not found")
        return

    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension .")
    sol = getSol()

    with open(f"{folder}/{fnum}.{ext}", "w") as f:
        f.write(sol)
 
    print("Do you have other solutions? (y/n) ")
    nsol = input("> ")
    while nsol == "y":
        print("Make sure to have solution in clipboard b4 type extension")
        ext = input("extension .")
        sol = getSol()      
        with open(f"{folder}/{fnum}.{ext}", "w") as f:
            f.write(sol)

        print("Do you have other solutions? (y/n) ")
        nsol = input("> ")

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