//: [Previous](@previous)

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
extension Sequence where Element == Int {
    var decimal: Int {
        var value = 0
        for b in self {
            value *= 2
            if b == 1 { value += 1 }
        }
        return value
    }
}

func partOne() {
    
    if let bundleURL = Bundle.main.url(forResource: "Day3", withExtension: "txt"),
       let contentsOfFile = try? String(contentsOfFile: bundleURL.path, encoding: .utf8) {
        let binaryNumbers: [String] = contentsOfFile.components(separatedBy: .newlines)
        print(binaryNumbers.count)
        
        var gamma: [Int] = []
        var epsilon: [Int] = []
        
        for index in 0..<12 {
            let specificBits = binaryNumbers.map{ $0[index] }
            
            let zeros = specificBits.filter { $0 == "0"}.count
            let ones = specificBits.filter { $0 == "1"}.count
            
            if zeros > ones {
                gamma.append(0)
                epsilon.append(1)
            }
            else {
                gamma.append(1)
                epsilon.append(0)
            }
            
        }
        
        print(gamma.decimal * epsilon.decimal)
    }
    
}



func partTwo() {
    
    if let bundleURL = Bundle.main.url(forResource: "Day3", withExtension: "txt"),
       let contentsOfFile = try? String(contentsOfFile: bundleURL.path, encoding: .utf8) {
        var binaryNumbers: [String] = contentsOfFile.components(separatedBy: .newlines)
        print(binaryNumbers.count)
        
        for index in 0..<12 {

            let specificBits = binaryNumbers.map{ $0[index] }
            
            let zeros = specificBits.filter { $0 == "0"}.count
            let ones = specificBits.filter { $0 == "1"}.count
            
            if zeros > ones {
            
                binaryNumbers = binaryNumbers.filter { $0[index] == "0" }
            }
            else {
            
                binaryNumbers = binaryNumbers.filter { $0[index] == "1" }
            }
            
            if binaryNumbers.count == 1 {
                
                break
            }
        
        }
        
        // oxygen generator rating
        print(binaryNumbers)
        
        for index in 0..<12 {

            let specificBits = binaryNumbers.map{ $0[index] }
            
            let zeros = specificBits.filter { $0 == "0"}.count
            let ones = specificBits.filter { $0 == "1"}.count
            
            if zeros > ones {
            
                binaryNumbers = binaryNumbers.filter { $0[index] == "1" }
            }
            else {
            
                binaryNumbers = binaryNumbers.filter { $0[index] == "0" }
            }
            
            if binaryNumbers.count == 1 {
                
                break
            }
            
            // CO2 scrubber rating
            print(binaryNumbers)
        
        }
    }
    
}

partOne()
partTwo()
