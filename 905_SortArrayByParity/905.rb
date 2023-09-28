# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity(nums)
  return nums.select{|n| n.even?} + nums.select{|n| n.odd?}
end