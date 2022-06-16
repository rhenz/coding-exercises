import Foundation


/*: ### Valid Parentheses
 
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:
```
 Input: s = "()"
 Output: true
 Example 2:
 

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 ```
 */
struct Stack<T> {
    private var storage: [T] = []
    public init() { }
    
    public init(_ elements: [T]) {
        storage = elements
    }
    
    // Helper Methods
    public mutating func pop() -> T? {
        storage.popLast()
    }
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    public func peek() -> T? {
        storage.last
    }
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return """
        ---top---
        \(storage.map{ "\($0)" }.reversed().joined(separator: "\n"))
        ---------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        storage = elements
    }
}


func isValid(_ s: String) -> Bool {
    var stack = Stack<Character>()

    for bracket in s {
        if bracket == "[" || bracket == "{" || bracket == "(" {
            stack.push(bracket)
            continue
        }
        
        if !stack.isEmpty && bracket == "]" && stack.peek() == "[" {
            stack.pop()
        } else if !stack.isEmpty && bracket == ")" && stack.peek() == "(" {
            stack.pop()
        } else if !stack.isEmpty && bracket == "}" && stack.peek() == "{" {
            stack.pop()
        } else {
            return false
        }
    }
    
    return stack.isEmpty
}


//isValid("()[]{}") // true
isValid("([}}])") // false

