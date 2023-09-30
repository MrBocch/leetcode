import os
from datetime import date
import pyperclip as pc
# to paste from clipboard 
# pyperclip.paste()


# def makeNotes():
#     dirlist = os.listdir(".")
#     today = str(date.today()) + "\n"

#     for d in dirlist:
#         if os.path.isdir(d) and not d==".git":
#             # print(f"{d} is a folder")
#             if not os.path.isfile(f"{d}/notes.txt"):
#                 # print(f"File notes.txt does not exist is {d}")
#                 with open(f"{d}/notes.txt", "w") as f:
#                     f.write(today)

def solvedNew():
    n     = input("Problem number: ")
    name  = input("Problem name (PascalCase): ")
    fname = f"{n}_{name}"

    print("Folder created "+ fname)
    os.mkdir(fname)

    print("Make sure to have solution in clipboard b4 type extension")
    ext = input("extension: .")
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
    nsol = input()
    while nsol == "y":
        print("Make sure to have solution in clipboard b4 type extension")
        ext = input("extension: .")
        sol = pc.paste()       
        sol = sol.replace('\r\n', '\r')
        with open(f"{fname}/{n}.{ext}", "w") as f:
            f.write(sol)

        print("Do you have other solutions? (y/n) ")
        nsol = input()



solvedNew()