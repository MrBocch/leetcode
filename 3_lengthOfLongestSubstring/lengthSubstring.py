class Solution:
    def lengthOfLongestSubstring(self, s: self) -> int:
        unique = {}
        max_unique = 0

        for i in range(len(s)):
            char = s[i]
            if char in unique:
                # we want the max size of substring
                max_unique = max(max_unique, len(unique))
                unique = {}
                unique[char] = True
            else:
                unique[char] = True
        
        return max_unique