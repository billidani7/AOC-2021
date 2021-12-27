//: [Previous](@previous)

import Foundation

let input = """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""

let linesArray = input.split(separator: "\n").map { String($0) }

let points: [String: Int] = [
    ")": 3,
    "]": 57,
    "}": 1197,
    ">": 25137
]

let openings: [String: String] = [
    "(": ")",
    "[": "]",
    "<": ">",
    "{": "}"
]

var invalids: [String: Int] = [:]

for line in linesArray {
    var stack: [String] = []
    
    let characters = Array(line)
    for c in characters {
        if openings.keys.contains(String(c)) {
            stack.append(String(c))
        }
        else if openings.values.contains(String(c)) {
            let key = stack.popLast()
            if openings[String(key!)] != String(c) {
                if (invalids[String(c)] != nil) {
                    invalids[String(c)]! += 1
                }
                else {
                    invalids[String(c)] = 1
                }
                
            }
        }
    }
}

var result = 0
invalids.forEach { key, value in
    //print("key = \(key), value = \(value)")
    result += value * points[key]!
}
print(result)


func partTwo() {
    var scores: [Int] = []
    
    let openings: [String: String] = [
        "(": ")",
        "[": "]",
        "<": ">",
        "{": "}"
    ]
    
    let points: [String: Int] = [
        ")": 1,
        "]": 2,
        "}": 3,
        ">": 4
    ]
    
    for line in linesArray {
        var stack: [String] = []
        
        var failed = false
        
        for c in line {
            if openings.keys.contains(String(c)) {
                stack.append(openings[String(c)]!)
            }
            else if stack.isEmpty || String(c) != stack.removeLast() {
                failed = true
                break
            }
        }
        
        if !failed {
            let score = stack.reversed().reduce(0) {
                $0 * 5 + points[$1]!
            }
            scores.append(score)
        }
    }
    let middleVal = scores.sorted()[scores.count / 2]
    print(middleVal)
}

partTwo()

//: [Next](@next)
