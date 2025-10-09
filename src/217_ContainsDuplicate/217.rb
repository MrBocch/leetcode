# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  set = Hash.new

  nums.each do |n|
    if set.include? n
      return true
    else
      set[n] = 1
    end
  end

  return false
end
