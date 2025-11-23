object Solution {
    def minimumOperations(nums: Array[Int]): Int = nums.count(n => n % 3 != 0)
}