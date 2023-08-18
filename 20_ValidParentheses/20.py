class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        pair = {
            ")":"(",
            "]":"[",
            "}":"{",
        }
        for char in s:
            if char in "({[":
                stack.append(char)
            else:
                try:
                    c = stack.pop()
                    if c != pair[char]:
                        return False
                    else:
                            return false
                except:
                    return False
        
        return not len(stack)

  