# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def has_increasing_subarrays(nums, k)
  (0...k).map{|n| reducer( nums[n..].each_slice(k).filter{|a| a.size == k}.map{|a| strict_sort(a, k) }, false) }.any?
end

def strict_sort(nums, k) 
  return nums == nums.sort && nums.size == nums.uniq.size 
end

def reducer(nums, prev)
  return false if nums == []
  return true if nums[0] && prev 
  return reducer(nums[1..], nums[0])
end
