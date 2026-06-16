/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteMiddle(head *ListNode) *ListNode {
    if head.Next == nil {
        head = nil
        return head 
    }
    slow := head 
    fast := head 
    var prev *ListNode
    for ; fast != nil ; { 
        if fast.Next == nil { break } 
        prev = slow 
        slow = slow.Next
        fast = fast.Next.Next
    }

    prev.Next = prev.Next.Next 
    return head
}
