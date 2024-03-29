# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  good = 0
  nums.length.times do |i|

    (i+1).upto( (nums.length)-1 ) do |j|
      if nums[i] == nums[j] then good += 1 end
    end
  end

  return good
end