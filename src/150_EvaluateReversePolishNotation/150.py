class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        stack = []
        for tok in tokens:
            if tok not in "+-*/":
                stack.append(int(tok))
                continue 

            op1 = stack.pop()
            op2 = stack.pop()
            if tok == "+":
                stack.append(op2+op1)
            elif tok == "-":
                stack.append(op2-op1)
            elif tok == "*":
                stack.append(op2*op1)
            elif tok == "/":
                stack.append( int(op2/op1) )
        return stack[0]
