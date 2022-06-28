import UIKit

/*: ### Roman to Integer
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
 ```
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 ```
 
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
 
 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
 
 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.
 
 */



//: ### Solution #1
func romanToInt(_ s: String) -> Int {
    
    let romanNumeralDict: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var sum = 0
    var lastValue = 0
    
    for val in s {
        let romanNumeralValue = romanNumeralDict[val] ?? 0
        
        if romanNumeralValue <= lastValue {
            sum += romanNumeralValue
        } else {
            sum = sum + (romanNumeralValue - lastValue)
            sum = sum - lastValue
        }
        
        lastValue = romanNumeralValue
    }
    return sum
}

romanToInt("III")
romanToInt("VI")
romanToInt("LVIII")
romanToInt("XLVII")
romanToInt("IV")
romanToInt("MCMXCIV")

//: ### Solution #2

let romanDictionary: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
]

func romanToInt2(_ s: String) -> Int {
    var romanValues: [Int] = []
    var previousValue = 0
    for roman in s {
        if let romanValue = romanDictionary[roman] {
            if previousValue < romanValue && previousValue != 0 {
                let difference = romanValue - previousValue
                romanValues.append(difference)
                romanValues.remove(at: romanValues.count - 2) // remove previous index
            } else {
                romanValues.append(romanValue)
            }
            previousValue = romanValue
        }
    }
    return romanValues.reduce(0, +)
}


romanToInt2("III")
romanToInt2("VI")
romanToInt2("LVIII")
romanToInt2("XLVII")
romanToInt2("IV")
romanToInt2("MCMXCIV")
