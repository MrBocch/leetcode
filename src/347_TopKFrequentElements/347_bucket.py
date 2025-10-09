from collections import Counter 

class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        freq = Counter(nums)
        bucket = [[] for _ in range(len(nums)+1)]
        for n, fr in freq.items():
            bucket[fr].append(n)

        k_count = k
        answer = []
        for l in bucket[::-1]:
            if k_count == 0:
                break 
            if l == []:
                continue


            k_count -= len(l) 
            answer.extend(l)
        return answer 