import os
from datetime import date
import pyperclip as pc

# there is an issue where, in the github code
# the code shows up without any newlines
# how annoying 
# when does this problem occur?
# and why?

def solvedNew():
    n     = input("Problem number: ")
    name  = input("Problem name (PascalCase): ")
    fname = f"{n}_{name}"

    print("Folder created "+ fname)
    os.mkdir(fname)

    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension .")
    sol = pc.paste()

    # adding unexpected newlines, when writing to file 
    sol = sol.replace('\r\n', '\r')
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
        sol = pc.paste()       
        sol = sol.replace('\r\n', '\r')
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
    sol = pc.paste()
    sol = sol.replace('\r\n', '\r')

    with open(f"{folder}/{fnum}.{ext}", "w") as f:
        f.write(sol)
 
    print("Do you have other solutions? (y/n) ")
    nsol = input("> ")
    while nsol == "y":
        print("Make sure to have solution in clipboard b4 type extension")
        ext = input("extension .")
        sol = pc.paste()       
        sol = sol.replace('\r\n', '\r')
        with open(f"{folder}/{fnum}.{ext}", "w") as f:
            f.write(sol)

        print("Do you have other solutions? (y/n) ")
        nsol = input("> ")

banner = '''
====================
= LEETCODE MANAGER =
====================
'''

exit = False
print(banner)
while not exit:
    print("(1). Solved a new problem")
    print("(2). Solved a old problem in diff new lang")
    print("(3). Exit")
    op = int(input("> "))
    if op == 3:
        exit = True
    
    if op == 1:
        solvedNew()

    if op == 2:
        oldNewLang()