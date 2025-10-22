object Solution {
    def numJewelsInStones(jewels: String, stones: String): Int = {
        val s : Map[Char, Int] = 
            stones.toArray.groupMapReduce(identity)(_=>1)(_+_)

        jewels.foldLeft(0)((acc, c) => s.get(c) match {
            case Some(count) => acc + count
            case None => acc
        })
    }
}