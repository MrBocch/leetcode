# @param {Integer[]} nums
# @return {Integer}
def min_element(nums)
  nums.map{|n| n.to_s.chars.map(&:to_i).sum }.min
end
