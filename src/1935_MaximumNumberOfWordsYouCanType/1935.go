func canBeTypedWords(text string, brokenLetters string) int {
    m := make(map[rune]bool) 
    
    for _, c := range brokenLetters {
        m[c] = true 
    }
    
    var not_count int = 0
    var size int = 0
    for _, word := range strings.Split(text, " ") {
        fmt.Println(word)
        size++
        for _, c := range word {
            if m[c] {
                not_count++
                break
            }
        }
    }

    return size - not_count
}