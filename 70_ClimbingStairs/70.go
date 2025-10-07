func climbStairs(n int) int {
    c := make(map[int]int)
    c[1] = 1
    c[2] = 2 
    for i := 3; i <= n; i++ { 
        c[i] = c[i-2] + c[i-1]
    }

    return c[n]
}