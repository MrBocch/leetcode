func strStr(haystack string, needle string) int {
    n0 := rune(needle[0])
    nlen := len(needle)
    for i, c := range haystack {
        if i + nlen > len(haystack) { break }
        if c != n0 { continue } 

        j := i
        nidx := 0
        for ; nidx < nlen; {
            if haystack[j] != needle[nidx] { break }
            j++ 
            nidx++
        } 
        if nidx == nlen { return i }
    }

    return -1
}