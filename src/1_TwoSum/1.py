class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # n + j = target
        # target - j = n
        spam = {}
        for i in range(len(nums)):
            if nums[i] in spam:
                return [i, spam[nums[i]]]

            else:
                spam[target - nums[i]] = i