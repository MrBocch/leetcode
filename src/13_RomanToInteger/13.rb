# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  } 
  n = 0
  i = 0
  # THIS IS SO UGLY
  while i < s.length do
    if s[i] == "I"
      if s[i+1] == "V"
        n += 4
        i += 2
      elsif s[i+1] == "X"
        n += 9
        i += 2
      else
        n += roman[s[i]]
        i += 1
      end

    elsif s[i] == "X"
      if s[i+1] == "L"
        n += 40
        i += 2
      elsif s[i+1] == "C"
        n += 90
        i += 2
      else 
        n += roman[s[i]]
        i += 1
      end
    
    elsif s[i] == "C"
      if s[i+1] == "D"
        n += 400
        i += 2
      elsif s[i+1] == "M"
        n += 900
        i +=2
      else
        n += roman[s[i]]
        i += 1
      end
    else
      n += roman[s[i]]
      i += 1
    end

  end

  return n
end