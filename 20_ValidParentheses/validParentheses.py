# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  pairs = {
    ")" => "(",
    "]" => "[",
    "}" => "{"
  }
  s.each_char { |char|
    if "({[".include? char
      stack.push char
    else
      if stack.empty? then return false end
      if not stack.pop == pairs[char] then return false end
    end
  }
  return stack.size == 0
end