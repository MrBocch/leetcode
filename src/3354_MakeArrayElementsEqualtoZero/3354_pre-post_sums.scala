object Solution {
    def countValidSelections(nums: Array[Int]): Int = {
        val n = nums.length
        val prefix  = nums.scanLeft(0)(_+_).tail
        val postfix = nums.scanRight(0)(_+_).take(n)
        0.to(n).zip(nums).filter((t: (Int, Int))=>t(1) == 0).map((t:(Int,Int)) => {
            val left = if t(0) != 0 then prefix(t(0)-1) else 0
            val right = if t(0)+1 < n then postfix(t(0)+1) else 0
            val diff = math.abs(left-right)
            diff match {
                case 0 => 2
                case 1 => 1 
                case _ => 0
            }
        }).sum
    }
}
