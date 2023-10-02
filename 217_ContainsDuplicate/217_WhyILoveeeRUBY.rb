# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  return nums.sort! .each_cons(2).any? {|a, b| a==b}
end