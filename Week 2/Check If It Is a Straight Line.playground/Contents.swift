import UIKit

/*
 
 1232. Check If It Is a Straight Line - Easy
 
 You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.
 
 Example 1:
 
 Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 Output: true
 
 Example 2:
 
 Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
 Output: false
 
 */

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count > 2 else{
            return true
        }
        
        let slope : Double = abs(Double(coordinates[1][1] - coordinates[0][1])/Double(coordinates[1][0] - coordinates[0][0]))
        //print("slope = \(slope)")
        for i in 1..<(coordinates.count-1){
            let temp : Double = abs(Double(coordinates[i+1][1] - coordinates[i][1])/Double(coordinates[i+1][0] - coordinates [i][0]))
            //print("temp = \(temp)")
            if temp != slope{
                return false
            }
        }
        return true
    }
}
