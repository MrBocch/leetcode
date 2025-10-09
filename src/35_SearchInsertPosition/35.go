func searchInsert(nums []int, target int) int {
    low := 0
    high := len(nums) -1
    mid := (low+high) / 2 
    for ;; {
        if nums[mid] == target { return mid }
        if low >= high { break }

        if nums[mid] > target {
            high = mid-1
            mid = (low+high) / 2
        } else {
            low = mid+1
            mid = (low+high) / 2
        }
    }

    if target > nums[mid] {
        return mid+1
    } else {
        return mid
    }
}
