/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func minDepth(root *TreeNode) int {
    if root == nil { return 0 }
    return depth(root, 1)
}

func depth(node *TreeNode, lvl int) int {
    if node.Left == nil && node.Right == nil {
        return lvl
    }

    lvl += 1
    if node.Left != nil && node.Right != nil {
        leftLvl  := depth(node.Left, lvl)
        rightLvl := depth(node.Right, lvl)
        if leftLvl < rightLvl { return leftLvl }
        return rightLvl 
    }
    if node.Left != nil {
        return depth(node.Left, lvl)
    }
    return depth(node.Right, lvl)
}
