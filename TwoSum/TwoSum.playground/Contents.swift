import UIKit

/*: ### Two Sum
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 You can return the answer in any order.
 
 Example #1:
 ```
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 ```
 
 Example #2:
 ```
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 ```
 */


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var complementDict: [Int: Int] = [:]
    var result: [Int] = []
    for (index, num) in nums.enumerated() {
        let numToLookFor = target - num
        
        if let foundComplement = complementDict[numToLookFor] {
            result = [foundComplement, index]
            continue
        }
        
        complementDict[num] = index
    }
    
    return result
}


twoSum([2,7,11,15], 9)
