func findPeakElement(nums []int) int {
    low := 0
    high := len(nums) -1
    mid := (low+high) / 2 
    for ;; {
        if mid == 0 || mid == len(nums)-1 {
            if nums[0] > nums[len(nums)-1] { return 0 }
            return len(nums) -1
        } 

        if nums[mid] > nums[mid-1] &&
               nums[mid] > nums[mid+1] { 
                return mid 
        }

        if nums[mid] < nums[mid-1] {
            high = mid // and not -1 here
            mid = (low+high) / 2
        } else {
            low = mid+1 // very odd that you add +1 in this case
            mid = (low+high) / 2
        }
    }
}
