# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []

  tokens.each do |c|
    if "+-*/".include? c 
      v1, v2 = stack.pop, stack.pop

      if c == "+" 
        stack.push (v2 + v1)
      end
      if c == "-"
        stack.push (v2 - v1)
      end
      if c == "*"
        stack.push (v2 * v1)
      end
      if c == "/"
        stack.push ((v2.to_f / v1.to_f).truncate)
      end

    else 
      stack.push c.to_i
    end
  end

  stack.first
end 