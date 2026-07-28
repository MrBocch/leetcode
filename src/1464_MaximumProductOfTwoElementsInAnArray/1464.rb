# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  nums.max(2).map(&:pred).reduce(&:*)
end
