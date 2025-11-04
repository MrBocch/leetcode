# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_x_sum(nums, k, x)
  nums.each_cons(k).map{|a|a.tally.sort_by{|k,v| [v, k]}}.map{|a| a.last(x).map{|b| b.reduce(1){|acc,v| acc*v}}.sum}
end
