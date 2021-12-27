//: [Previous](@previous)

import Foundation

func calculate(input: [String], biggest: Bool = true) {
    var digits: [Int] = Array(repeating: 0, count: 14)
    var stack: [[Int]] = []
    
    for i in 0..<14 {
    
        let xVal = Int(input[18 * i + 5].components(separatedBy: " ")[2])!
        var yVal = Int(input[18 * i + 15].components(separatedBy: " ")[2])!
        
        if xVal > 0 {
            stack.append([yVal, i])
        }
        else {
            var toAdd = 0
            
            let s = stack.popLast()!
            yVal = s[0]
            
            let yIndex = s[1]
            
            if biggest {
                toAdd = 9
                while toAdd + yVal + xVal > 9 {
                    toAdd -= 1
                }
            }
            else {
                toAdd = 1
                while toAdd + yVal + xVal < 1 {
                    toAdd += 1
                }
            }
            
            digits[yIndex] = toAdd
            digits[i] = toAdd + yVal + xVal
        }

    }
    
    print(digits)
}

let input = """
"""

let data = input.components(separatedBy: "\n")

calculate(input: data)


//: [Next](@next)
