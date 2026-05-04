# @param {String} s
# @param {String} goal
# @return {Boolean}
def rotate_string(s, goal)
  def get_cl(str)
    (str << str[0]).chars.each_cons(2).map(&:join).tally
  end 

  get_cl(s) == get_cl(goal)
end