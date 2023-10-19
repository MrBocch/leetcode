# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  sbuck = []
  s.each_char do |c|
    if c != "#"
      sbuck.push(c)
    else sbuck.pop() end
  end 

  tbuck = []
  t.each_char do |c|
    if c != "#"
      tbuck.push(c)
    else tbuck.pop() end
  end 

  return sbuck == tbuck
end