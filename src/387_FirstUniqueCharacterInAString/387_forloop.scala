object Solution {
    def firstUniqChar(s: String): Int = {
        val tally: Map[Char, Int] =
            s.foldLeft(Map.empty[Char, Int]) { (tally, c) =>
                tally.updatedWith(c) {
                case Some(v) => Some(v + 1)
                case None    => Some(1)
            }
        }

        var ans = -1
        var flag = true
        for ((chr, idx) <- s.zipWithIndex) {
            if (flag && tally(chr) == 1) { 
                ans = idx
                flag = false
            }
        }

        ans 
    }
}