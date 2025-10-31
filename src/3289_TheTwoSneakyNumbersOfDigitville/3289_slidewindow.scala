object Solution {
    def getSneakyNumbers(nums: Array[Int]): Array[Int] = {
        nums.sorted.sliding(2).filter((v)=> v(0) == v(1)).map((v) => v(0)).toArray
    }
}