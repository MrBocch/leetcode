object Solution {
    def isPalindrome(s: String): Boolean = {
        val letters = s.filter(c => c.isLetter || c.isDigit).toLowerCase
        letters == letters.reverse 
    }
}