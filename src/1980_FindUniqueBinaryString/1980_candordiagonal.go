func findDifferentBinaryString(nums []string) string {
    ans := ""
    var c string
    for i := 0 ; i < len(nums) ; i++ {
        if nums[i][i] == '0' {
            c = "1"
        } else {
            c = "0"
        }
        ans += c
    }

    return ans
}