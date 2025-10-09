# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
    arr.each_cons(3).any?{|l| l.all?(&:odd?)}
end