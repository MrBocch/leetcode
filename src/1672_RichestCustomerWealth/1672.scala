object Solution {
    def maximumWealth(accounts: Array[Array[Int]]): Int = {
        accounts.map(_.sum).max
    }
}
