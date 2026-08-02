impl Solution {
    pub fn minimum_pushes(word: String) -> i32 {
        let mut sum = 0;
        let mut lvl = 1;
        let mut count = 0;
        for c in word.chars() {
            sum += lvl;
            count += 1;
            if count % 8 == 0 {
                lvl += 1;
            }
        } 

        sum 
    }
}    
