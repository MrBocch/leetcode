# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    s = s.split
    return s[-1].length
end

# so kool
# return s.split() .last .length