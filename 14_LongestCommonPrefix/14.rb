# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  prefix = []
  smallestString = (strs.min {|a, b| a.length <=> b.length}).length-1
  matrix = strs.map{|s| s.split("")}

  0.upto(smallestString) do |i|
    set = Set[]
    0.upto(strs.length-1) do |k|
      set.add(matrix[k][i])
    end

    if set.size == 1 then prefix << set.to_a else return prefix.join("") end
  end
  return prefix.join("")
end