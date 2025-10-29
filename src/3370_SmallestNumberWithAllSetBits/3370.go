func smallestNumber(n int) int {
    for i := float64(1); ; i++ {
        bits := int(math.Pow(2, i)) -1 
        if bits >= n { return bits }
    } 
    return 0
}