func maxBottlesDrunk(numBottles int, numExchange int) int {
    var drinking func(int, int, int, int) int 
    drinking = func(numBottles int, numExchange int, emptyBottles int, drank int) int {
        if numBottles > 0 {
            return drinking(0, numExchange, emptyBottles+numBottles, drank+numBottles)
        } else if emptyBottles >= numExchange {
            return drinking(numBottles+1, numExchange+1, emptyBottles-numExchange,drank)
        }

        return drank
    }
    return drinking(numBottles, numExchange, 0, 0)
}