import UIKit

/*: ### Palindrome Number
 
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward.

 For example, 121 is a palindrome while 123 is not.
  

 ```
 Example 1:

 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 
 Example 3:

 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 ```
 
 */

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 { return false }
    if x < 10  { return true }
    
    var tempX = x
    var tempString = ""
    
    while tempX > 0 {
        let x = tempX % 10
        tempString += "\(x)"
        tempX = (tempX - x) / 10
    }
    
    return Int(tempString)! == x
}

isPalindrome(121) // true
isPalindrome(2) // true
isPalindrome(-121) // false
isPalindrome(1212) // false
