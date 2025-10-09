# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
  n <= 0 ? false : 4 ** Math.log(n, 4).to_i == n ? true : false
end