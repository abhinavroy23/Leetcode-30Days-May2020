import UIKit

/*
 
 993. Cousins in Binary Tree - Easy
 
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
 
 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
 
 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
 
 Return true if and only if the nodes corresponding to the values x and y are cousins.
 
 
 Example 1:
 
 
 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:
 
 
 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:
 
 
 
 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
 
 
 Note:
 
 The number of nodes in the tree will be between 2 and 100.
 Each node has a unique integer value from 1 to 100.
 
 */


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        func isSiblings(_ root : TreeNode?,_ x : Int,_ y : Int) -> Bool{
            guard let root = root else{
                return false
            }
            
            var output : Bool = false
            if let left = root.left, let right = root.right{
                output = (left.val == x && right.val == y) || (right.val == x && left.val == y)
            }
            return output || isSiblings(root.left, x, y) || isSiblings(root.right, x, y)
        }
        
        func levelFor(_ node : TreeNode?,_ x : Int,_ level : Int) -> Int{
            guard let node = node else{
                return 0
            }
            
            if node.val == x{
                return level
            }
            let l = levelFor(node.left, x, level + 1)
            if l != 0{
                return l
            }
            return levelFor(node.right, x, level + 1)
        }
        
        guard let root = root else{
            return false
        }
        
        return (levelFor(root, x, 1) == levelFor(root, y, 1)) && !isSiblings(root, x, y)
    }
}
