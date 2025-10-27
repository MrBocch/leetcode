object Solution {
    def numberOfBeams(bank: Array[String]): Int = {
        if bank.map(_.count(_=='1')).filter(_!=0).size <= 1 then 0 else bank.map(_.count(_=='1')).filter(_!=0).sliding(2).map(_.product).sum
    }
}