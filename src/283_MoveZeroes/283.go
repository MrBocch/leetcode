func moveZeroes(nums []int)  {
    p := 0
    for i, v := range nums {
        if v != 0 {
            nums[p] = nums[i]
            p++
        }
    }

    for ; p < len(nums); p++ {
        nums[p] = 0
    }
}