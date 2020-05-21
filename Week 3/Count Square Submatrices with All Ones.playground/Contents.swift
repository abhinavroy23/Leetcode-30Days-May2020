import UIKit

/*
 1277. Count Square Submatrices with All Ones - Medium
 
 Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

  

 Example 1:

 Input: matrix =
 [
   [0,1,1,1],
   [1,1,1,1],
   [0,1,1,1]
 ]
 Output: 15
 Explanation:
 There are 10 squares of side 1.
 There are 4 squares of side 2.
 There is  1 square of side 3.
 Total number of squares = 10 + 4 + 1 = 15.
 Example 2:

 Input: matrix =
 [
   [1,0,1],
   [1,1,0],
   [1,1,0]
 ]
 Output: 7
 Explanation:
 There are 6 squares of side 1.
 There is 1 square of side 2.
 Total number of squares = 6 + 1 = 7.
  

 Constraints:

 1 <= arr.length <= 300
 1 <= arr[0].length <= 300
 0 <= arr[i][j] <= 1
 
 */

class Solution {
    // naive solution
//     func countSquares(_ matrix: [[Int]]) -> Int {
//         var result : Int = 0
//         let m : Int = matrix.count
//         let n : Int = matrix[0].count
        
//         for i in 0..<m{
//             for j in 0..<n{
//                 for k in 0..<(m<n ? m : n){
//                     var arr : [Int] = [Int]()
//                     for l in 0...k{
//                         for o in 0...k{
//                             let cord : (Int,Int) = (i+l,j+o)
//                             if cord.0 < m, cord.1 < n{
//                                 arr.append(matrix[cord.0][cord.1])
//                             }else{
//                                 arr.append(0)
//                             }
//                         }
//                     }
//                     let newArr = arr.filter{return $0 == 1}
//                     if newArr.count == arr.count{
//                         result += 1
//                     }
//                 }
//             }
//         }
//         return result
//     }
    
    // dp solution - O(n^2)
     func countSquares(_ matrix: [[Int]]) -> Int {
        var m : Int = matrix.count
        var n : Int = matrix[0].count

        var dp : [[Int]] = matrix.map{$0}
        var result : Int = 0

        for i in 0..<m{
            for j in 0..<n{
                if i > 0 && j > 0 && dp[i][j] >= 1{
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                }
                result += dp[i][j]
            }
        }
        return result
    }
}
