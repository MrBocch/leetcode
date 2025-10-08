func successfulPairs(spells []int, potions []int, success int64) []int {
    slices.Sort(potions)
    var solution []int
    cache := make(map[int64] int)

    for _, n := range spells {
        n64 := int64(n)
        hit, ok := cache[n64]
        if ok {
            solution = append(solution, hit)
            continue 
        }
        find := success / n64
        if success % n64 != 0 {
            find++
        }

        idx := searchInsert(potions, find)
        ans := len(potions) - idx 
        cache[n64] = ans 
        solution = append(solution, ans)
    }

    return solution  
}

func searchInsert(nums []int, target int64) int {
    low := 0
    high := len(nums) -1
    mid := (low+high) / 2 
    for ;; {
        if int64(nums[mid]) == target { break }
        if low >= high { break }

        if int64(nums[mid]) > target {
            high = mid-1
            mid = (low+high) / 2
        } else {
            low = mid+1
            mid = (low+high) / 2
        }
    }

    if target > int64(nums[mid]) {
        return mid+1
    } else {
        if mid == 0 { return mid }
        if int64(nums[mid-1]) == target {
            for ; mid > 0; mid-- {
                if int64(nums[mid-1]) != target { return mid }
            }
        }
        return mid
    }
}
