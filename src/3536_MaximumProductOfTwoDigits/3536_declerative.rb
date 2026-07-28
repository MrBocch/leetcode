# @param {Integer} n
# @return {Integer}
def max_product(n)
  n.digits.max(2).reduce(&:*)
end