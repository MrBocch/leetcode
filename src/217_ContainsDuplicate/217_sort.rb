# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.sort!
  0.upto(nums.length-2){|i|
    if nums[i] == nums[i+1]
      return true
    end
  }

  return false
end