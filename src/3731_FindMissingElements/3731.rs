use std::collections::HashSet;

impl Solution {
    pub fn find_missing_elements(nums: Vec<i32>) -> Vec<i32> {
        let (min, max) = min_max(&nums);

        let mut ans: Vec<i32> = vec!();
        let set: HashSet<_> = nums.into_iter().collect();

        for i in min..=max {
            if !set.contains(&i) { 
                ans.push(i);
            }
        }

        ans
    }
}

fn min_max(nums: &Vec<i32>) -> (i32, i32) {
    let mut min = nums[0];
    let mut max = nums[0];

    for n in nums {
        if *n > max { max = *n; }
        if *n < min { min = *n; }
    }

    (min, max)
}