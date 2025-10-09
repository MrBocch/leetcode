impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        // let s: Vec<&str> = x.to_string().split("").collect();
        // E0716
        if x < 0 {
            return false
        }

        let temp = x.to_string();
        let s: Vec<&str> = temp.split("").collect();

        let mut j = s.len()-1;
        for i in 0..s.len() {
            if s[i] != s[j] {
                return false
            } else {
                j -= 1;
            }
        }

        true
    }
}