func max(a int, b int) int {
    if a > b { return a }
    return b 
}

func lengthOfLongestSubstring(s string) int {
    if len(s) == 0 { return 0 }

    left := 0
    right := 1
    longest := 0
    subs := make(map[byte]bool)
    subs[s[left]] = true 

    for ; right < len(s) ; {
        c := s[right]
        _, include := subs[c]

        if !include {
            subs[c] = true 
            right++
            continue 
        }

        longest = max(longest, len(subs))
        for ; s[left] != c ; left++ {
            delete(subs, s[left])
        }
        delete(subs, s[left])
        left++
        
    }

    return max(longest, len(subs))
}