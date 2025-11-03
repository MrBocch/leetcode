# @param {String} colors
# @param {Integer[]} needed_time
# @return {Integer}
def min_cost(colors, needed_time)
  colors.split("").zip(needed_time)
  .slice_when{|a, b| a[0] != b[0]}
  .filter{|a| a.size > 1}
  .map{|a| a.map{|b| b.last }}
  .map{|a| a.sort.take(a.size-1)}
  .flatten.sum
end