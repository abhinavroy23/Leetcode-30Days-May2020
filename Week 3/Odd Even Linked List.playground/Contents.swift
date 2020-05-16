import UIKit

/*
 328. Odd Even Linked List - Medium
 
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

 Example 1:

 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 Example 2:

 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 Note:

 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
         guard let head = head else{
            return nil
        }
        
        var currentBegin : ListNode? = head
        var currentEnd : ListNode? = head
        var length : Int = 1
        
        while currentEnd?.next != nil{
            currentEnd = currentEnd?.next
            length += 1
        }
        
        guard length > 2 else{
            return head
        }
        
        // printList(currentBegin)
        
        var tempNode : ListNode? = head
        var currentEndTemp : ListNode? = currentEnd
        var count : Int = 1
        while count < length {
            count += 1
            if count % 2 == 0{
                var temp = tempNode?.next
                tempNode?.next = tempNode?.next?.next
                temp?.next = nil
                currentEndTemp?.next = temp
                currentEndTemp = currentEndTemp?.next
            }else{
                tempNode = tempNode?.next
            }
        }
        
        // printList(currentBegin)
        
        return currentBegin
    }
}