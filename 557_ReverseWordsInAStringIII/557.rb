# @param {String} s
# @return {String}
def reverse_words(s)
   return s.split(" ").each{|w| w.reverse!}.join(" ")
end