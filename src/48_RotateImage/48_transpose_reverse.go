func rotate(matrix [][]int)  {
    transpose(matrix)
    reverse_rows(matrix)
}

func transpose[T any](matrix [][]T) {
    for i := 0 ; i < len(matrix) ; i++ {
        for j := 0 ; j < len(matrix[i]) ; j++ {
            if j <= i { continue }
            matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        }
    }
}

func reverse_rows[T any](matrix [][]T) {
    for i := 0; i < len(matrix) ; i++ {
        reverse(matrix[i])
    }
}    

func reverse[T any](arr []T) {
    left := 0
    right := len(arr) -1
    for ; left < right ; left, right = left+1, right-1{
        arr[left], arr[right] = arr[right], arr[left]
    }
}
