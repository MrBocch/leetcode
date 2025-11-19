func findFinalValue(nums []int, original int) int {
    lookup := make(map[int]bool)
    for _, n := range nums{
        lookup[n] = true 
    }
    
    for _, ok := lookup[original] ; ok ; {
        original *= 2
        _, ok = lookup[original]
    }

    return original 
}