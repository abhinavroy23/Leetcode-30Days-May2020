import UIKit

/*
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count >= 1 else{
            return -1
        }
        func findIndex(ofChar char : Character) -> Int{
            let asciiOfA = Character("a").asciiValue!
            let indexofElem = char.asciiValue!
            return Int(indexofElem-asciiOfA)
        }
        
        var countArr : [Int] = Array.init(repeating: 0, count: 26)
        for char in s{
            let index = findIndex(ofChar: char)
            countArr[index] = countArr[index] + 1
        }
        for (i,char) in s.enumerated(){
            if countArr[findIndex(ofChar: char)] == 1{
                return i
            }
        }
        return -1
    }
}
