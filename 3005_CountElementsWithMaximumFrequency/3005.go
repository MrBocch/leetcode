func maxFrequencyElements(nums []int) int {
    freq := make(map[int]int)
    for _, n := range nums {
        freq[n]++
    }
    maxf := 0
    count := 1
    for _, v := range freq {
        if v > maxf {
            maxf = v
            count = 1
        } else if v == maxf {
            count++
        }
    }

    return count * maxf
}