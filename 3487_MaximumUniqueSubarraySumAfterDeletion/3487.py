class Solution:
    def maxSum(self, nums: List[int]) -> int:
        max_sum = set()
        for n in nums:
            if n > 0:
                max_sum.add(n)
        
        # in case only negative numbers 
        if len(max_sum) == 0:
            return max(nums)

        return sum(max_sum)