# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []

  tokens.each do |c|
    if "+-*/".include? c 
      temp = [stack[-2], stack[-1]]
      stack = stack.reverse.drop(2)

      if c == "+" 
        stack.push (temp[-2] + temp[-1])
      end
      if c == "-"
        stack.push (temp[-2] - temp[-1])
      end
      if c == "*"
        stack.push (temp[-2] * temp[-1])
      end
      if c == "/"
        stack.push((temp[-2].to_f / temp[-1].to_f).truncate) 
      end
      # p stack 
    else 
      stack.push c.to_i
    end
  end

  stack.first
end 
