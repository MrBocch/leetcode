func removeElement(nums []int, val int) int {
    last := len(nums) - 1
    first := 0
    count := 0

    if last < 0 { return 0 }
    if first == last {
        if nums[0] != val { count ++ }
        return count 
    }

    for ;; {
        if first > last { break }

        if nums[first] != val {
            count++
            first++
            continue
        }
        if nums[last] == val {
            last--
            continue
        }

        nums[first], nums[last] = nums[last], nums[first]
    }

    return count
}