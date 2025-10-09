class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        best_buy = prices[0]
        max_p = 0

        for point in prices[1:]:
            if point < best_buy:
                best_buy = point
                continue

            max_p = max(max_p, point-best_buy)
        
        return max_p
