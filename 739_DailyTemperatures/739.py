class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:

        asc = []
        ans = []
        for i in range(len(temperatures)-1, -1, -1):
            temp = temperatures[i]
            if asc == []:
                asc.append( (temp, i) )
                ans.append(0) 
                continue 

            if temp < asc[-1][0]:
                ans.append( asc[-1][1] - i )
                asc.append( (temp, i) )
                continue
            
            while asc != [] and temp >= asc[-1][0]:
                asc.pop()

            if asc == []:
                ans.append(0)
                asc.append( (temp, i) )
                continue 

            asc.append( (temp, i) )
            ans.append( asc[-2][1] - i ) # if you asc[-2][1] what a funny mistake

        return ans[::-1]