class MinStack:

    def __init__(self):
        self.stack = []
        self.min = None 

    def push(self, val: int) -> None:
        if self.min == None:
            self.min = val 
        elif self.min > val:
            self.min = val 

        self.stack.append(val)

    def pop(self) -> None:
        poped = self.stack.pop()
        if len(self.stack) == 0:
            self.min = None 
            return None 

        if poped > self.min:
            return None 

        self.min = self.stack[0]
        for n in self.stack:
            if n < self.min:
                self.min = n
         

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        min = self.stack[0]
        for n in self.stack:
            if min > n:
                min = n 

        return min 
    


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()