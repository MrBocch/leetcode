# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
    k = k % nums.length
    return if k == 0

    nnums = nums
            .each_with_index
            .to_a
            .map{|ar| [ar[0], (ar[1]+k) %nums.size]}

    nnums.each do |ar|
        nums[ar[1]] = ar[0]
    end
end