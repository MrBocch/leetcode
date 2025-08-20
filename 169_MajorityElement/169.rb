# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    majority = nums.size / 2

    return nums.tally.filter{|k, v| v > majority}.keys.first
end