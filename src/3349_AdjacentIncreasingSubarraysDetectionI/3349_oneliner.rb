# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def has_increasing_subarrays(nums, k)
  (0...k).map { |n| (nums[n..].each_slice(k).filter{|a| a.size == k}.map{|a| a==a.sort() && a.size==a.uniq.size}).each_cons(2).any?{|a,b|a&&b}}.any?
end


