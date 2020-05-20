import UIKit

/*
 230. Kth Smallest Element in a BST - Medium
 
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 Example 1:

 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 Example 2:

 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var data : Int? = nil
        var count : Int = 1
        kthSmallestUtil(root, &data, &count, k)
        return data!
    }
    
    func kthSmallestUtil(_ root : TreeNode?,_ data : inout Int?, _ count : inout Int,_ k : Int){
        guard let root = root else{
            return
        }
        
        if let left = root.left{
            kthSmallestUtil(left, &data, &count, k)
        }
        if count == k{
            data = root.val
        }
        count += 1
        if let right = root.right {
            kthSmallestUtil(right, &data, &count, k)
        }
    }
}
