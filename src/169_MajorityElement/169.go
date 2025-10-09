func majorityElement(nums []int) int {

    var count = make(map[int] int) // inits to zero
    var n int = len(nums)
    var majority int = n / 2

    for i := 0 ; i < n; i++ {
        count[nums[i]] += 1
        if count[nums[i]] > majority {
            return nums[i]
        } 
    }

    return -1
}