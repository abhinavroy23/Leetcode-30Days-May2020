import UIKit

/*
 
 367. Valid Perfect Square - Easy
 
 Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 Note: Do not use any built-in library function such as sqrt.
 
 Example 1:
 
 Input: 16
 Output: true
 Example 2:
 
 Input: 14
 Output: false
 
 */

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num >= 0 else{
            return false
        }
        if num == 1 || num == 0{
            return true
        }
        return perfectSquareUtil(0, (num/2)+1, num)
    }
    
    func perfectSquareUtil(_ low : Int,_ high : Int,_ num : Int) -> Bool{
        let mid : Int = (low + high)/2
        if low < high{
            if mid*mid == num{
                return true
            }else if mid*mid < num{
                return perfectSquareUtil(mid+1, high, num)
            }else if mid * mid > num{
                return perfectSquareUtil(low, mid, num)
            }
        }
        return false
    }
    
}
