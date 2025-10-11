func Max(a int, b int) int {
    if a > b { return a }
    return b 
}

func findMaxConsecutiveOnes(nums []int) int {
    max := 0 
    curr := 0
    for _, n := range nums {
        fmt.Println(n, curr)
        if n == 0 {
            max = Max(max, curr)
            curr = 0
        } else {
            curr += 1
        }
    }

    return Max(max, curr)
}
