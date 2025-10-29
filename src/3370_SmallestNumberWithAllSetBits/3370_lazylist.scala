object Solution {
    def smallestNumber(n: Int) = LazyList.from(1).map(x => (math.pow(2, x) - 1).toInt).dropWhile(_ < n).head
}