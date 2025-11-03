func max(a int, b int) int {
    if a > b { return a }
    return b 
}

func minCost(colors string, neededTime []int) int {
    ptr := 0 
    cost := 0

    for ; ptr < len(colors)-1 ; {
        if colors[ptr] != colors[ptr+1] {
            ptr += 1
            continue 
        }
        sum := 0
        cur := ptr 
        nmax := neededTime[ptr]
        for ; cur < len(colors) && colors[ptr] == colors[cur]; cur++ {
            sum += neededTime[cur]
            nmax = max(nmax, neededTime[cur])
        }
        ptr = cur
        cost += sum - nmax 
    }

    return cost 
}