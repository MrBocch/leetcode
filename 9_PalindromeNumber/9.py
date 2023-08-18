class Solution:
    def isPalindrome(self, x: int) -> bool:
        num = str(x)
        mun = num[::-1]

        return num == mun
