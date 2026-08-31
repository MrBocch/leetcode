/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func nodesBetweenCriticalPoints(head *ListNode) []int {
    ans := make([]int, 2)
    ans[0] = minimumDistance(head)
    ans[1] = maximumDistance(head)
    return ans 
}

func isCritical(a int, b int, c int) bool {
    if a == -1 { return false } 
    return (b > a && b > c) || (b < a && b < c)
}

func minimumDistance(head *ListNode) int {
    // a -> b -> c 
    a := -1 
    b := -1
    c := -1 
    minD := -1
    lastCP := -1 
    idx := 1

    curr := head 
    for ; curr != nil ; {
        c = curr.Val

        if isCritical(a, b, c) {
            if lastCP != -1 {
                if minD == -1 {
                    minD = idx - lastCP
                } else {
                    curDistance := idx - lastCP  
                    minD = min(minD, curDistance)
                }
            } 
            lastCP = idx
        }

        idx += 1
        a = b 
        b = c 
        curr = curr.Next
    }

    return minD 
}
func maximumDistance(head *ListNode) int {
    // a -> b -> c 
    a := -1 
    b := -1
    c := -1 
    firstCP := -1 
    lastCP := -1 
    idx := 1
    

    curr := head 
    for ; curr != nil ; {
        c = curr.Val

        if isCritical(a, b, c) {
            if firstCP == -1 {
                firstCP = idx
            } else {
                lastCP = idx 
            }
        }

        idx += 1
        a = b 
        b = c 
        curr = curr.Next
    }
    maxD := -1

    if firstCP != -1 && lastCP != -1 {
        maxD = lastCP - firstCP
    }

    return maxD 
}