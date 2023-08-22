# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman = {
    "I" => 1, "V" => 5,
    "X" => 10, "L" => 50,
    "C" => 100, "D" => 500,
    "M" => 1000
  } 
  
  n = 0
  
  (0..s.length).each { |i| 
    if i+1 < s.length
      if roman[s[i]] < roman[s[i+1]] 
        n -= roman[s[i]]
      else
        n += roman[s[i]]
      end
    end
  }
  # how to add last 
  n += roman[s[-1]]

  return n
end