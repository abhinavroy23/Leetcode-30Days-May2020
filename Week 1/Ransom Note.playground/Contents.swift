import UIKit


/*
 383. Ransome Note - Easy
 
Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

Each letter in the magazine string can only be used once in your ransom note.

Note:
You may assume that both strings contain only lowercase letters.

canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true

 */

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var hashMap : [Character : Int] = [Character : Int]()
        
        for char in ransomNote{
            if let val = hashMap[char]{
                hashMap[char] = val + 1
            }else{
                hashMap[char] = 1
            }
        }
        
        for char in magazine{
            if let val = hashMap[char], val >= 0{
                if val == 1{
                    hashMap[char] = nil
                }else{
                    hashMap[char] = val - 1
                }
            }
        }
        return hashMap.isEmpty
    }
}
