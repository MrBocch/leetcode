# @param {Integer} n
# @return {Integer}
def gcd_of_odd_even_sums(n)
  (1..).lazy.filter(&:odd?).take(n).sum.gcd((1..).lazy.filter(&:even?).take(n).sum) 
end