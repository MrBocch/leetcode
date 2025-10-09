class Solution:
    def makeFancyString(self, s: str) -> str:
        fancy_string = ""
        for c in s:
            strlen = len(fancy_string) 
            if strlen < 2 :
                fancy_string += c
                continue
            prev1 = fancy_string[strlen -1] 
            prev2 = fancy_string[strlen -2] 
            if not(prev1 == c and prev2 == c):
                fancy_string += c 
    
        return fancy_string
