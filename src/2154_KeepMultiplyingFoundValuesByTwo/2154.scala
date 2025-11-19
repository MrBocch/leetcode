object Solution {
    def findFinalValue(nums: Array[Int], original: Int): Int = {
       val tally = nums.toSet
       def loop(original: Int): Int = {
            tally.contains(original) match {
                case true  => loop(original*2)
                case false => original
            } 
       }

       loop(original)
    }
}