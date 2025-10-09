class Solution:
    def makeFancyString(self, s: str) -> str:
        if len(s) <3 : return s
        fancy_string = [s[0], s[1]]
        for c in s[2:]:
            # prev1 = fancy_string[-2] 
            # prev2 = fancy_string[-1] 
            if not(fancy_string[-2] == c and fancy_string[-1] == c):
                fancy_string.append(c) 
    
        return ''.join(fancy_string)