# @param {Integer} n
# @return {Integer}
def mirror_distance(n)
  (n - n.to_s.reverse.to_i).abs
end
