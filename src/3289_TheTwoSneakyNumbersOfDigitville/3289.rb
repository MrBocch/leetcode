# @param {Integer[]} nums
# @return {Integer[]}
def get_sneaky_numbers(nums)
  nums.tally.filter{|k,v| v > 1}.keys 
end