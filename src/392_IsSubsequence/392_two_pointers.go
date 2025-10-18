func isSubsequence(s string, t string) bool {
    if s == "" { return true }

    i := 0
    for j := 0; j < len(t) ; j++ {
        if s[i] == t[j] { i++ }
        if i == len(s) { break }
    }

    return i == len(s)
}
