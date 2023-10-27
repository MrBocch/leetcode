# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length == 1
  return s if s.length == 2 and s == s.reverse
  (0..s.length).each do |i|
    s.split("").each_cons(s.length()-i) {|sub| 
      if sub == sub.reverse 
        return sub.join "" 
      end
    }
  end
end
