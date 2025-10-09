# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  p = l1
  accumulate1 = [p.val]
  while(p.next != nil) 
    p = p.next
    accumulate1.push(p.val)
  end

  p2 = l2
  accumulate2 = [p2.val]
  while(p2.next != nil) 
    p2 = p2.next
    accumulate2.push(p2.val)
  end

 return ((accumulate1.reverse.join("").to_i() + accumulate2.reverse.join("").to_i()).to_s.split("").reverse).map{|n| n.to_i}
  
end