# @param {Integer} n
# @return {Integer}
def digit_frequency_score(n)
  n.digits.tally.map{|k, v| k * v}.sum
end