import UIKit

/*
 438. Find All Anagrams in a String - Medium
 
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

 The order of output does not matter.

 Example 1:

 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 
 */

class Solution {
     func findAnagrams(_ s: String, _ p: String) -> [Int] {
        func charIndex(_ char : Character) -> Int{
            return Int(char.asciiValue! - Character("a").asciiValue!)
        }
        
        
        var result : [Int] = [Int]()
        guard s.count > p.count else {
            return result
        }
        
        let s = s.map { charIndex($0) }
        let p = p.map { charIndex($0) }
        
        var originalMap = Array(repeating: 0, count: 26)
        for char in p {
            originalMap[char] += 1
        }
        var map = originalMap.map { _ in 0 }
        for i in 0..<s.count {
            map[s[i]] += 1
            if i - p.count >= 0 {
                map[s[i-p.count]] -= 1
            }
            
            if map == originalMap {
                result.append(i - p.count + 1)
            }
        }
        return result
    }
}
