func rangeAddQueries(n int, queries [][]int) [][]int {
    matrix := make([][]int, n)
    for i := 0; i < n; i++ {
        matrix[i] = make([]int, n)
    }

    for _, v := range queries {
        a1, a2 := v[0], v[1]
        b1, b2 := v[2], v[3]
        for i:= a1 ; i <= b1 ; i++ {
            for j := a2 ; j <= b2 ; j++ {
                matrix[i][j]++ 
            }
        }
    }

    return matrix 
}
