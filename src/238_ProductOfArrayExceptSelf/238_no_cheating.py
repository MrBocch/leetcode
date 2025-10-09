class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        pre = []
        prod = 1
        for n in nums:
            prod *= n
            pre.append(prod)
        prod = 1
        post = []
        for n in nums[::-1]:
            prod *= n
            post.append(prod)

        post = post[::-1]
        ans = []
        nlen = len(nums)
        for idx in range(nlen):
            if idx == 0:
                ans.append(post[1])
                continue
            if idx == nlen-1:
                ans.append(pre[-2])
                continue 
            
            prod = pre[idx-1] * post[idx+1]
            ans.append(prod)


        return ans 