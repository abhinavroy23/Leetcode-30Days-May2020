import UIKit

/*
 886. Possible Bipartition - Medium
 
 Given a set of N people (numbered 1, 2, ..., N), we would like to split everyone into two groups of any size.

 Each person may dislike some other people, and they should not go into the same group.

 Formally, if dislikes[i] = [a, b], it means it is not allowed to put the people numbered a and b into the same group.

 Return true if and only if it is possible to split everyone into two groups in this way.

  

 Example 1:

 Input: N = 4, dislikes = [[1,2],[1,3],[2,4]]
 Output: true
 Explanation: group1 [1,4], group2 [2,3]
 Example 2:

 Input: N = 3, dislikes = [[1,2],[1,3],[2,3]]
 Output: false
 Example 3:

 Input: N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 Output: false
  

 Note:

 1 <= N <= 2000
 0 <= dislikes.length <= 10000
 1 <= dislikes[i][j] <= N
 dislikes[i][0] < dislikes[i][1]
 There does not exist i != j for which dislikes[i] == dislikes[j].
 
 */

class Solution {
    
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        guard dislikes.count > 0 else{
            return true
        }
        
        var graph : [[Int]] = Array(repeating: [],count: N+1)
        var color : [Int : Int] = [Int : Int]()
        
        for edge in dislikes{
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        for node in 1...N{
            if !color.keys.contains(node) && !dfs(node,0,&color,graph){
                return false
            }
        }
        return true
    }
    
    func dfs(_ node : Int,_ c : Int,_ color : inout [Int:Int],_ graph : [[Int]]) -> Bool{
        if color.keys.contains(node){
            return color[node] == c
        }
        color[node] = c
        
        for i in graph[node]{
            if !dfs(i,c^1,&color,graph){
                return false
            }
        }
        return true
    }
    
}
