import os
from datetime import date

dirlist = os.listdir(".")
today = str(date.today()) + "\n"

for d in dirlist:
    if os.path.isdir(d) and not d==".git":
        # print(f"{d} is a folder")
        if not os.path.isfile(f"{d}/notes.txt"):
            # print(f"File notes.txt does not exist is {d}")
            with open(f"{d}/notes.txt", "w") as f:
                f.write(today)
