func numWaterBottles(numBottles int, numExchange int) int {
    var drinking func(int, int, int) int 
    drinking = func(numBottles int, emptyBottles int, drank int) int {
        if numBottles > 0 {
            return drinking(0, emptyBottles+numBottles, drank+numBottles)
        } else if emptyBottles >= numExchange {
            return drinking(emptyBottles/numExchange, emptyBottles%numExchange, drank)
        }

        return drank
    }
    return drinking(numBottles, 0, 0)
}
