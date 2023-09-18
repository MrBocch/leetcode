# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}
def k_weakest_rows(mat, k)
  strength = []
  mat.each_with_index do |row, index| 
    strength.push([row.count(1), index])
  end

  strength.sort_by! {|n| n[0]}

  weakest = []
  k.times do |i|
    weakest.push(strength[i][1])
  end

  return weakest
end