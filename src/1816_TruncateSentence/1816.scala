object Solution {
    def truncateSentence(s: String, k: Int): String = s.split(" ").take(k).mkString(" ")
}
