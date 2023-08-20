# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)

  (digits.length()-1).downto(0) do |i|
    if digits[i] + 1 <= 9
      digits[i] += 1 
      return digits
    else
      digits[i] = 0
    end
  end

  if digits[0] == 0 then digits.insert 0, 1 end
  return digits
end