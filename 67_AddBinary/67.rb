# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  # i want to try this without any built in methods
  return (a.to_i(2) + b.to_i(2)) .to_s(2)
end