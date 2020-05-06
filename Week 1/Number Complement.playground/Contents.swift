import UIKit

/*
 
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
 
 Example 1:
 
 Input: 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
 
 
 Example 2:
 
 Input: 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
 
 
 Note:
 
 The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 You could assume no leading zero bit in the integer’s binary representation.
 This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/
 
 */

class Solution {
    
    //     func binary(_ num : Int) -> [Int]{
    //         guard num != 0 else{
    //             return [0]
    //         }
    
    //         var temp : Int = num
    //         var result : [Int] = [Int]()
    
    //         while temp >= 1{
    //             result.append(temp % 2)
    //             temp = temp / 2
    //         }
    //         if temp == 1{
    //             result.append(temp)
    //         }
    
    //         return result.reversed()
    //     }
    
    //     func decimal(_ nums : [Int]) -> Int{
    //         guard nums.count > 0 else{
    //             return 0
    //         }
    
    //         var sum : Int = 0
    //         for num in nums{
    //             sum = sum * 2 + (num == 0 ? 1 : 0)
    //         }
    //         return sum
    //     }
    
    //     func findComplement(_ num: Int) -> Int {
    //         return decimal(binary(num))
    //     }
    
    func binary(_ num : Int,_ sum : inout Int){
        var temp : Int = num
        if temp > 1{
            binary(temp >> 1,&sum)
        }
        sum = sum * 2 + ((temp & 1) == 1 ? 0 : 1)
    }
    
    func findComplement(_ num : Int) -> Int{
        var sum : Int = 0
        binary(num, &sum)
        return sum
    }
}
