# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
  i = 1
  while(i <= n) do
    if i == n then return true end
    i *= 4
  end 

  return false
end