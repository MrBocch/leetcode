/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
**/


type Info struct {
    Sum int
    Length int 
    Count int // amount of nodes that are equal to sum/length
} 

func averageOfSubtree(root *TreeNode) int {
    return helper(root).Count
}

func helper(root *TreeNode) Info {
    left := Info{}
    right := Info{}
    if root.Left != nil {
        left = helper(root.Left)
    }
    if root.Right != nil {
        right = helper(root.Right)
    }

    sum := root.Val + left.Sum + right.Sum
    length := 1 + left.Length + right.Length
    counts := left.Count + right.Count 
    if sum / length == root.Val {
        counts += 1
    }

    return Info{Sum: sum, Length: length, Count: counts}
}

func leafNode(root *TreeNode) bool {
    return root.Left == nil && root.Right == nil
}