/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteMiddle(head *ListNode) *ListNode {
    length := lengthList(head)
	if length == 0 {
        head = nil
        return head 
    }

	cutIdx := length / 2 
    if length % 2 != 0 { cutIdx += 1 }
    
    curr := head
    for i := 0 ; i < cutIdx -1; i++ {
        curr = curr.Next
    }
    curr.Next = curr.Next.Next
    return head
}

func lengthList(head *ListNode) int {
    i := 0
    curr := head 
    for ; curr.Next != nil ; i++ {
        curr = curr.Next
    }

    return i 
}
