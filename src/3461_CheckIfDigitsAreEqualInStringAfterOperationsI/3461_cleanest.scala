object Solution {
    def hasSameDigits(s: String): Boolean = {
        @scala.annotation.tailrec
        def loop(digits : Array[Int]) : Boolean = digits match {
            case Array(n1, n2) => n1 == n2
            case _ => loop(digits.sliding(2).map(s => (s(0)+s(1)) % 10).toArray)
        }

        val d = s.split("").map(_.toInt).sliding(2).map(s => (s(0)+s(1)) % 10).toArray
        loop(d)
    }
}
