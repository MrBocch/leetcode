func rotate(nums []int, k int)  {
    k %= len(nums)
    var rev func(left int, right int) 
    rev = func(left int, right int) {
        for ; left < right ; left, right = left+1, right-1{
            nums[left], nums[right] = nums[right], nums[left]
        }
    }
    rev(0, len(nums)-k-1)
    rev(len(nums)-k, len(nums)-1)
    rev(0, len(nums)-1)
}