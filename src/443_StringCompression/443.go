func compress(chars []byte) int {
    type group struct {
        letter byte
        count int 
    }    
    var groups []group
    for i := 0; i < len(chars); i++{
        skip := 0
        curr := chars[i]
        for j := i ;j < len(chars); j++ {
            if chars[j] == curr {
                skip++
            } else {
                break
            }
        }
        g := group{ letter:chars[i], count: skip}
        groups = append(groups, g)
        i += skip -1
    }

    char_idx := 0
    for gi := 0; gi < len(groups); gi++ {
        group := groups[gi]

        chars[char_idx] = group.letter
        char_idx++
        if group.count == 1 {
            continue
        }

        s := strconv.Itoa(group.count)   
        b := []byte(s)     
        for _, c := range b {
            chars[char_idx] = c 
            char_idx++
        }    

    }
    return char_idx 
}