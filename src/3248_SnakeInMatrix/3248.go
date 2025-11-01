func finalPositionOfSnake(n int, commands []string) int {
    i := 0 
    j := 0 
    for _, cmd := range commands {
        switch cmd {
        case "UP":    i -= 1
        case "DOWN":  i += 1
        case "LEFT":  j -= 1
        case "RIGHT": j += 1
        }
    }

    return (i * n) + j
}