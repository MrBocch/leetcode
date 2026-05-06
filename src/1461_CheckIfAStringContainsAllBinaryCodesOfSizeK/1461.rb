# @param {String} s
# @param {Integer} k
# @return {Boolean}
def has_all_codes(s, k)
  s.chars.each_cons(k).map(&:join).uniq.length == 2**k
end