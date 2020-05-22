import UIKit

/*
 451. Sort Characters By Frequency - Medium
 
 Given a string, sort it in decreasing order based on the frequency of characters.

 Example 1:

 Input:
 "tree"

 Output:
 "eert"

 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:

 Input:
 "cccaaa"

 Output:
 "cccaaa"

 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:

 Input:
 "Aabb"

 Output:
 "bbAa"

 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
 
 */

class Solution {
    func frequencySort(_ s: String) -> String {
       var map : [Character : Int] = [Character : Int]()
        for char in s{
            if let val = map[char]{
                map[char] = val + 1
            }else{
                map[char] = 1
            }
        }
        
        var coll = map.sorted{ $0.value > $1.value }
        var result : String = ""
        for (key,val) in coll{
            result += String(repeating: key, count: val)
        }
        return result
    }
}
