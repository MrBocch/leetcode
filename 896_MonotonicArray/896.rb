# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(nums)
  return (nums == nums.sort or nums == nums.sort.reverse)
end