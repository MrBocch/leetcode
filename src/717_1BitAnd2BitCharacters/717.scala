object Solution {
    def isOneBitCharacter(bits: Array[Int]): Boolean = bits match {
            case Array(0)    => true 
            case Array(1, 0) => false 
            case Array(1, 1) => false 
            case Array(x, _*) => if x == 0 
                then isOneBitCharacter(bits.tail)
                else isOneBitCharacter(bits.tail.tail)
        }
}