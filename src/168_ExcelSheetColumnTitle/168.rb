# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  ans = ''
  while column_number > 0
    column_number -= 1
    ans += ((column_number % 26) + 65).chr
    column_number /= 26   
  end

  return ans.reverse
end