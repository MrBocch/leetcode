object Solution {
    def hasSameDigits(s: String): Boolean = {
        var digits = s.split("").map(_.toInt).sliding(2).map(s => (s(0)+s(1)) % 10).toArray

        while digits.length > 2 do 
            digits = digits.map(_.toInt).sliding(2).map(s => (s(0)+s(1)) % 10).toArray

        digits(0) == digits(1)
    }
}