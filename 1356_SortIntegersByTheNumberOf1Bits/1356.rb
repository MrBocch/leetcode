# @param {Integer[]} arr
# @return {Integer[]}
def sort_by_bits(arr)
  stable = arr.sort 
  stable.sort_by {|n| n.to_s(2).count("1")}  
end