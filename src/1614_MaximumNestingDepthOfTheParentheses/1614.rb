# @param {String} s
# @return {Integer}
def max_depth(s)
  lvl = 0
  max_lvl = 0
  s.split("").filter{|c| c=="(" || c==")"}.each do |c| 
    c == '(' ? lvl +=1 : lvl -= 1 
    max_lvl = [lvl, max_lvl].max
  end
  max_lvl
end