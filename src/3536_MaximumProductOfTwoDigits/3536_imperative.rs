impl Solution {
    pub fn max_product(n: i32) -> i32 {
        let mut m1 = 0;
        let mut m2 = 0;
        let mut n = n;

        while n != 0 {
            let dig = n % 10;
            n /= 10;

            if dig >= m1 {
                m2 = m1;
                m1 = dig;
            } else if dig > m2 {
                m2 = dig;   
            }
            
        }

        m1 * m2
    }
}