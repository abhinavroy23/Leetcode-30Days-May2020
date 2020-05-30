import UIKit

/*
 207. Course Schedule - Medium
 
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0. So it is possible.
 Example 2:

 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0, and to take course 0 you should
              also have finished course 1. So it is impossible.
  

 Constraints:

 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 1 <= numCourses <= 10^5
 
 */

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard prerequisites.count > 0 else{
            return true
        }
        
        var graph : [[Int]] = Array(repeating: [],count: numCourses)
        
        for pre in prerequisites{
            graph[pre[0]].append(pre[1])
        }
        
        var visited : [Int] = Array(repeating: 0, count: numCourses)
        
        for i in 0..<numCourses{
            if visited[i] == 0 && !visit(graph,i,&visited){
                return false
            }
        }
        return true
    }
    
    func visit(_ graph : [[Int]],_ i : Int,_ visited : inout [Int]) -> Bool{
        visited[i] = -1
        for n in graph[i]{
            if visited[n] == -1 || visited[n] == 0 && !visit(graph,n,&visited){
                return false
            }
        }
        visited[i] = 1
        return true
    }
  
}
