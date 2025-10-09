# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
    arr.each_cons(3).filter{|l| l.all? {|n| n.odd?}}.size > 0
end