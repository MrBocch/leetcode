# @param {Integer[]} nums
# @return {Integer[]}
def find_missing_elements(nums)
  (nums.minmax[0]..nums.minmax[1]).to_a - nums
end
