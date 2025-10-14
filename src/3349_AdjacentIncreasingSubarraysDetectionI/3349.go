func hasIncreasingSubarrays(nums []int, k int) bool {
    if k == 1 { return true }

    prev := false 
    for i:=0; i < k; i++ {
        curr := true 
        for j:=i; j+k <= len(nums); j+=k {
            curr = isSortedStrict(nums, j, j+k-1)
            if prev && curr { return true }
            prev = curr
        }

        prev = false
    }

    return false
}

func isSortedStrict(nums []int, a int, b int) bool {
    for i := a ; i < b; i++ {
        if nums[i] >= nums[i+1] { return false }
    } 
    return true 
}