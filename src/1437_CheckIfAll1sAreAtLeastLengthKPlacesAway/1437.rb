# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
  if k == 0 then return true end 
  while nums.last != 1 && nums.size > 0 do nums.pop end 
  while nums.first != 1 && nums.size > 0 do nums.shift end 
  groups = nums.slice_when { |a, b| a != b }
  groups.filter{|a| a.first == 1}.all?{|a| a.size == 1} && groups.filter{|a| a.first == 0}.all?{|a| a.size >= k}
end