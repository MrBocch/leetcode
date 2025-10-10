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
    leafs := make([]*TreeNode, 1)
    leafs[0] = root
    return depth(leafs, 1)
}

func depth(leafs []*TreeNode, lvl int) int {
    var nleafs []*TreeNode
    for _, leaf := range leafs {
        if leaf.Left == nil && leaf.Right == nil {
            return lvl
        }

        if leaf.Left != nil {
            nleafs = append(nleafs, leaf.Left)
        }
        if leaf.Right != nil {
            nleafs = append(nleafs, leaf.Right)
        }
    }
    lvl += 1 
    return depth(nleafs, lvl)
}
