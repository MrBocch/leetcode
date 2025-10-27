object Solution {
    def numberOfBeams(bank: Array[String]): Int = {
        val intr = bank.map(_.count(_=='1')).filter(_!=0)
        intr.size match {
            case 0 | 1 => 0
            case _ => intr.sliding(2).map(_.product).sum
        }
    }
}
