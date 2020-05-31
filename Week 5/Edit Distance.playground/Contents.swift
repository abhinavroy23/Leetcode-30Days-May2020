import UIKit

/*
 72. Edit Distance - Hard
 
 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

 You have the following 3 operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1 != word2 else{
            return 0
        }
        
        var arr : [[Int]] = Array(repeating: Array(repeating: 0,count: word2.count+1),count: word1.count+1)
        for i in 0..<arr.count{
            arr[i][0] = i
        }
        for i in 0..<arr[0].count{
            arr[0][i] = i
        }
        
        let w1 = Array(word1)
        let w2 = Array(word2)
        
        for i in 1..<arr.count{
            for j in 1..<arr[0].count{
                if w1[i-1] == w2[j-1]{
                    arr[i][j] = arr[i-1][j-1]
                }else{
                    arr[i][j] = 1 + min(arr[i-1][j-1],arr[i][j-1],arr[i-1][j])
                }
            }
        }
        return arr[word1.count][word2.count]
    }
}
