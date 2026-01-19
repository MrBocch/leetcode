object Solution {
    def firstUniqChar(s: String): Int = {
        var tally = Array.fill(26)(0)
        for (chr <- s) {
            tally(chr.toInt - 97) += 1
        }

        var ans = -1
        var idx = 0
        var flag = true
        for (chr <- s) {
            if (flag && tally(chr.toInt - 97) == 1) { 
                ans = idx
                flag = false
            }
            idx += 1
        }

        ans 
    }
}