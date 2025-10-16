func maxArea(height []int) int {
    i := 0
    j := len(height)-1

    max_area := 0
    for ; i < j ; {
        w := j - i 
        h := min(height[i], height[j]) 
        area := w * h
        max_area = max(max_area, area)

        if height[i] > height[j] {
            j -= 1
        } else {
            i += 1
        }
    }     

    return max_area
}

func min(a int, b int) int {
    if a > b { return b }
    return a
}

func max(a int, b int) int {
    if a > b { return a }
    return b
}