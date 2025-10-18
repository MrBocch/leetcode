# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  t.chars.reduce(0){|i, c| i + (c == s[i] ? 1 : 0) } == s.size
end
