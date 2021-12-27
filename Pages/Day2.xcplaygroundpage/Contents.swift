//: [Previous](@previous)

import Foundation

if let bundleURL = Bundle.main.url(forResource: "aoc-day2", withExtension: "txt"),
   let contentsOfFile = try? String(contentsOfFile: bundleURL.path, encoding: .utf8) {
    let components: [String] = contentsOfFile.components(separatedBy: .newlines)
    print(components.count)

    var horizontal = 0
    var depth = 0
    var aim = 0
    
    for item in components {
        let seperated = item.components(separatedBy: " ")
        print(seperated)
        
        if seperated[0] == "forward" {
            horizontal += Int(seperated[1])!
            if aim > 0 {
                depth = depth + (Int(seperated[1])! * aim)
            }
        }
        
        if seperated[0] == "down" {
            aim += Int(seperated[1])!
        }
        
        if seperated[0] == "up" {
            aim -= Int(seperated[1])!
        }
    }
    
    print(horizontal)
    print(depth)
    
    let total = horizontal * depth
    print(total)
}

