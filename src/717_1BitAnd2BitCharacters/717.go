func isOneBitCharacter(bits []int) bool {
    for i := 0; i < len(bits); {
        if bits[i] == 1 {
            if i + 2 >= len(bits) { return false }
            i += 2
        } else {
            i++
        }
    }

    return true 
}