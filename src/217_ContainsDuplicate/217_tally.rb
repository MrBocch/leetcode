# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.tally().each_value{|n| return true if n>1}
  
  return false
end