# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
  s = stones.split("").tally
  ans = 0
  jewels.each_char do |j|
    ans += if s.key?(j) then s[j] else 0 end 
  end

  ans 
end
