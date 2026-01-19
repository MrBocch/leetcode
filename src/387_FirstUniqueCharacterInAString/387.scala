object Solution {
    def firstUniqChar(s: String): Int = {
        val tally: Map[Char, Int] =
            s.foldLeft(Map.empty[Char, Int]) { (tally, c) =>
                tally.updatedWith(c) {
                case Some(v) => Some(v + 1)
                case None    => Some(1)
            }
        }
        def loop(s: String, idx: Int): Int = {
            if s == "" then -1
            else 
                if tally(s.head) == 1 then idx
                else loop(s.tail, idx+1)
        }

        loop(s, 0)
    }
}