//: [Previous](@previous)

import Foundation

let input = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

let lines = input.components(separatedBy: "\n")

let givenString = lines[0]

let map = lines[2..<lines.count]

var rules: [String: String] = [:]
map.forEach {
    let parts = $0.components(separatedBy: " -> ")
    rules[parts[0]] = parts[1]
}
//print(rules)

var pairs: [String: Int] = [:]

for i in 0..<givenString.count - 1 {
    let pair = givenString[i..<i+2]
    pairs[pair] = 1
}

//print(pairs)

for _ in 0..<10 {
    var newPairs: [String: Int] = [:]
    for (pair, count) in pairs {
        //print("\(pair) = \(count)")
        let inserting = rules[pair]
        let newPair1 = String(pair.first!) + inserting!
        if (newPairs[newPair1] != nil) {
            newPairs[newPair1]! += count
        }
        else {
            newPairs[newPair1] = count
        }
        
        let newPair2 = inserting! + String(pair.last!)
        if (newPairs[newPair2] != nil) {
            newPairs[newPair2]! += count
        }
        else {
            newPairs[newPair2] = count
        }
    }
    
    pairs = newPairs
}

//print(pairs)

var counts: [String: Int] = [:]
for (pair, count) in pairs {
    let char = String(pair.last!)
    if (counts[char] != nil) {
        counts[char]! += count
    }
    else {
        counts[char] = count
    }
}

counts[String(givenString.first!)]! += 1

let max = counts.values.max()
let min = counts.values.min()

print(max! - min!)

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}

//: [Next](@next)
