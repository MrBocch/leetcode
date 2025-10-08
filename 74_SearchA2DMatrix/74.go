func searchMatrix(matrix [][]int, target int) bool {
    if len(matrix) == 1 { return binarySearch(matrix[0], target) }
    mlen := len(matrix[0])-1
    
    low := 0
    high := len(matrix) -1
    var mid int 
    for ;; {
        mid = (low + high) / 2 
        if low >= high { break }
        if target >= matrix[mid][0] && target <= matrix[mid][mlen] {
            break
        } 
        if matrix[mid][0] > target && matrix[mid][mlen] > target {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    return binarySearch(matrix[mid], target) 
}

func binarySearch(array []int, target int) bool {
    low := 0
    high := len(array) -1
    var mid int 
    for ;; {
        mid := (low+high) / 2 
        if array[mid] == target { return true }

        if low >= high { break }
        if array[mid] > target {
            high = mid-1
        } else {
            low = mid+1
        }
    } 
    if array[mid] == target { return true }
    return false 
}