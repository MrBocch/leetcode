func maxBottlesDrunk(numBottles int, numExchange int) int {
    drank := 0
    emptyBottles := 0   
    for ; ; {
        if numBottles > 0 {
            drank += numBottles
            emptyBottles += numBottles 
            numBottles = 0
        } 
        if emptyBottles >= numExchange {
            numBottles++
            emptyBottles -= numExchange 
            numExchange++
        } else {
            return drank 
        }
    }
}
