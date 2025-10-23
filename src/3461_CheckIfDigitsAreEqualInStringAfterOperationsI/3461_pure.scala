object Solution {
    def hasSameDigits(s: String): Boolean = {
        val d = s.split("").map(_.toInt).sliding(2).map(s => (s(0)+s(1)) % 10).toArray

        @scala.annotation.tailrec
        def loop(digits : Array[Int]) : Boolean = {
            if digits.length > 2 then
                loop(digits.map(_.toInt).sliding(2).map(s => (s(0)+s(1)) % 10).toArray)
            else 
                digits(0) == digits(1)
        }

        loop(d)
    }
}
