func countValidSelections(nums []int) int {
    sum := 0
    n_sum := 0
    for _, v := range(nums) { n_sum += v }
    for i, v := range(nums) {
        if v == 0 {
            if simulate(nums, i, -1, n_sum) { sum += 1 }
            if simulate(nums, i,  1, n_sum) { sum += 1 }
        }
    }
    return sum
}

// left = -1, right = 1
func simulate(nums []int, curr int, direction int, n_sum int) bool {
    backup := make([]int, len(nums)) 
    copy(backup, nums)              
    size := len(backup)-1

    for ; ; {
        if curr + direction > size || curr + direction < 0 {
            return n_sum == 0
        }
        if backup[curr+direction] > 0 {
            backup[curr+direction] -= 1
            n_sum -= 1
            direction *= -1
        } else {
            curr += direction
        }

    }
}