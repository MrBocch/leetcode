/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def modifiedList(nums: Array[Int], head: ListNode): ListNode = {
        val cache = nums.toSet 
        var ptr = head 
        while (cache contains ptr.x) { ptr = ptr.next }
        
        val newHead = ptr
        while (ptr != null && ptr.next != null) {
            if !cache.contains(ptr.next.x) then 
                ptr = ptr.next 
            else 
                var ahead = ptr.next
                while (ahead != null && cache.contains(ahead.x)) { ahead = ahead.next}
                ptr.next = ahead 
                ptr = ptr.next 
        }

        newHead 
    }
}
