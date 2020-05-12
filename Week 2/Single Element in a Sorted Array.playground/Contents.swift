import UIKit

/*
 540. Single Element in a Sorted Array - Medium
 
 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

 
 Example 1:

 Input: [1,1,2,3,3,4,4,8,8]
 Output: 2
 Example 2:

 Input: [3,3,7,7,10,11,11]
 Output: 10
  

 Note: Your solution should run in O(log n) time and O(1) space.
 
 */

/*
[1,1,2,3,3,4,4,8,8], l = 0, h = 9, m = 4
    [1,1,2,3,3], l = 0, h = 4, m = 2
        [1,1,2]
 
        [3,3]
    
    [4,4,8,8],l
        []
    
 */


class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        return singleNonDuplicateUtil(nums, 0, nums.count-1)
    }

    func singleNonDuplicateUtil(_ nums : [Int],_ low : Int,_ high : Int) -> Int{
        if low < high{
            var mid : Int = (low + high)/2

            if mid % 2 == 0{
                if nums[mid] == nums[mid+1]{
                    return singleNonDuplicateUtil(nums, mid+2, high)
                }else{
                    return singleNonDuplicateUtil(nums, low, mid)
                }
            }else{
                if nums[mid] == nums[mid-1]{
                    return singleNonDuplicateUtil(nums, mid+1, high)
                }else{
                    return singleNonDuplicateUtil(nums, low, mid-1)
                }
            }
        }else if low == high{
            return nums[low]
        }else{
            return -1
        }
    }
}
