# @param {String} s
# @return {Integer}
def max_depth(s)
  s.split("").filter{|c| c=="(" || c==")"}.reduce([0,0]){ | (carry, max), c| [carry + (if c=='(' then 1 else -1 end ), if carry>max then carry else max end ]}[1]
end