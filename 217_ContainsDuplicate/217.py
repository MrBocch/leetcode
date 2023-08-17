class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        dup = {}
        for n in nums:
            if n in dup:
                return True
            else:
                dup[n] = 1
        
        return False