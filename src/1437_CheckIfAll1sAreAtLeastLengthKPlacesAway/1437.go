func kLengthApart(nums []int, k int) bool {
    for i, v := range nums {
        if v == 1 {
            for j := i+1; j <= i + k && j < len(nums); j++ {
                if nums[j] == 1 { return false }
            }
        }
    }

    return true 
}