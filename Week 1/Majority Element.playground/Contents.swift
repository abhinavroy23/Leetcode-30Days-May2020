import UIKit

/*
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 Example 1:
 
 Input: [3,2,3]
 Output: 3
 Example 2:
 
 Input: [2,2,1,1,1,2,2]
 Output: 2
 
 */

class Solution {
    /*
     //Solution 1 : O(nlogn), no extra space
     func majorityElement(_ nums: [Int]) -> Int {
     return nums.sorted()[nums.count/2]
     }
     
     //Solution 2 : O(n), space O(n)
     func majorityElement(_ nums: [Int]) -> Int {
     var hashMap : [Int : Int] = [Int : Int]()
     for num in nums{
     if let val = hashMap[num] {
     hashMap[num] = val + 1
     }else{
     hashMap[num] = 1
     }
     }
     for (key,value) in hashMap{
     if value > (nums.count/2){
     return key
     }
     }
     return -1
     }
     */
    //Solution 3 : O(n), space : O(2)
    func majorityElement(_ nums: [Int]) -> Int {
        var majority : Int = nums[0]
        var count : Int = 1
        
        for i in 1..<nums.count{
            if majority == nums[i]{
                count += 1
            }else if count == 0{
                majority = nums[i]
                count = 1
            }else{
                count -= 1
            }
        }
        return majority
    }
}
