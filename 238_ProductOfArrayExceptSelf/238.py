class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        # the same as, longest sequence turn nums into set 
        zero_count = 0
        prod = 1
        for n in nums:
            if n == 0:
                zero_count += 1
                continue 
            prod *= n   

        if zero_count > 1:
            prod = 0
        
        answ = []
        for n in nums:
            ans = None
            if n == 0:
                ans = prod 
                answ.append(ans)
                continue 
            if zero_count == 1:
                ans = 0 
            elif zero_count > 1:
                ans = 0
            else:
                ans = int( prod/n ) 
            answ.append( ans )
        
        return answ 