# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  return nums != nums.uniq
end