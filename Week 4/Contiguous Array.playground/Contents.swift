import UIKit

/*
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 Example 1:
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 Example 2:
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 Note: The length of the given binary array will not exceed 50,000.
 
 */

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map : [Int : Int] = [Int : Int]()
        map[0] = -1
        
        var maxLen : Int = 0
        var count: Int = 0
        
        for (i,elem) in nums.enumerated(){
            count = count + (elem == 1 ? 1 : -1)
            if let val = map[count]{
                maxLen = max(maxLen, i-val)
            }else{
                map[count] = i
            }
        }
        return maxLen
    }
}
