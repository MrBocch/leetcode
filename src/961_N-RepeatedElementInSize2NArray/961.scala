object Solution {

    def repeatedNTimes(nums: Array[Int]): Int = {
        val tally =
        nums.foldLeft(Map.empty[Int, Int]) { (tally, n) =>
            tally.updatedWith(n) {
                case Some(v) => Some(v + 1)
                case None    => Some(1)
            }
        }

        tally.find((k, v) => v == nums.length / 2) match { 
            case Some(k->v) => k
            case _          => -1
        }
        
    }
}