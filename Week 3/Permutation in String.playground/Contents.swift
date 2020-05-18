import UIKit

/*
 567. Permutation in String - Medium
 
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

  

 Example 1:

 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
  

 Note:

 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 
 */


class Solution {
   func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        func charIndex(_ char : Character) -> Int{
            return Int(char.asciiValue! - Character("a").asciiValue!)
        }
        
        var s1 : [Character] = Array(s1)
        var s2 : [Character] = Array(s2)
        guard s1.count > 1 else{
            return s2.contains(s1[0])
        }
       
        guard s2.count >= s1.count else{
            return false
        }
        
        var map : [Int] = Array(repeating: 0, count: 26)
        var currMap : [Int] = Array(repeating: 0, count: 26)
        for i in 0..<s1.count{
            map[charIndex(s1[i])] += 1
            currMap[charIndex(s2[i])] += 1
        }
        
        for i in s1.count..<s2.count{
            //print("map = \(map)")
            //print("cur = \(currMap)")
            // Check both maps and return true if both are equal
            if currMap == map{
                return true
            }
            
            // Add one character
            currMap[charIndex(s2[i])] += 1
            
            // Remove one character
            currMap[charIndex(s2[i-s1.count])] -= 1
        }
        
        return currMap == map
    }
}
