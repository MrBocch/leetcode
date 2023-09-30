# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(nums)
  # very tiny improvement
  snums = nums.sort
  return (nums == snums or nums == snums.reverse)
end

