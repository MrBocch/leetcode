class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        if nums == []:
            return 0

        look_up = set(nums)
        lngs_seq = 0

        for n in look_up:
            if n-1 in look_up:
                continue

            curr_seq = 1
            while n+curr_seq in look_up:
                curr_seq += 1

            lngs_seq = max(lngs_seq, curr_seq)
            
        return lngs_seq