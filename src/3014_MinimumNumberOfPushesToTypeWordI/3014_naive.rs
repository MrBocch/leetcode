use std::collections::HashMap;

impl Solution {
    pub fn minimum_pushes(word: String) -> i32 {
        makeMap(&word).values().sum()
    }
}    

fn makeMap(word: &String) -> HashMap<char, i32> {
    let mut map: HashMap<char, i32> = HashMap::new();
    let mut lvl = 1;
    let mut count = 0;
    for c in word.chars() {
        map.insert(c, lvl);
        count += 1;
        if count % 8 == 0 {
            lvl += 1;
        }
    } 

    map
}