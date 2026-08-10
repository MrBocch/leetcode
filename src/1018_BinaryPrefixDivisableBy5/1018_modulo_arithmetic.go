func prefixesDivBy5(nums []int) []bool {
    ans := make([]bool, len(nums))    

    last := 0
    for i := 0; i < len(nums) ; i++ {
        t := ((last << 1) + nums[i]) % 5 
        ans[i] = t == 0
        last = t 
    }

    return ans 
}
