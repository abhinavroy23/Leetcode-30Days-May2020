import UIKit

/*
 1008. Construct Binary Search Tree from Preorder Traversal - Medium
 
 Return the root node of a binary search tree that matches the given preorder traversal.
 
 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)
 
 It's guaranteed that for the given test cases there is always possible to find a binary search tree with the given requirements.
 
 Example 1:
 
 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]
 
 Constraints:
 
 1 <= preorder.length <= 100
 1 <= preorder[i] <= 10^8
 The values of preorder are distinct.
 
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var index : Int = 0
        return bstUtil(preorder,&index,0,preorder.count-1)
    }
    
    func bstUtil(_ pre : [Int],_ index : inout Int,_ low : Int,_ high : Int) -> TreeNode?{
        if index >= pre.count || low > high{
            return nil
        }
        
        var root : TreeNode = TreeNode(pre[index])
        index += 1
        
        if low == high{
            return root
        }
        
        var i : Int = low
        while i <= high {
            if pre[i] > root.val{
                break
            }
            i += 1
        }
        
        root.left = bstUtil(pre, &index, index, i-1)
        root.right = bstUtil(pre, &index, i, high)
        return root
    }
}
