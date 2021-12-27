//: [Previous](@previous)

import Foundation

let input = """
[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
"""

class SnailfishPair: NSObject {
    
    var left: Fish {
        didSet {
            if case let .fish(pair) = left {
                pair.previous = self
            }
        }
    }
    var right: Fish {
        didSet {
            if case let .fish(pair) = right {
                pair.previous = self
            }
        }
    }
    
    var previous: SnailfishPair?
    
    var level: Int {
        if previous != nil {
            return previous!.level + 1
        }
        return 0
    }
    
    init(
        left: Fish,
        right: Fish
    ) {
        self.left = left
        self.right = right
        
        super.init()
        
        if case let .fish(pair) = left {
            pair.previous = self
        }
        if case let .fish(pair) = right {
            pair.previous = self
        }
    }
    
    var getString: String {
        return "[\(left.getString()),\(right.getString())]"
    }
    
    var copy: SnailfishPair {
        SnailfishPair(left: left.deepCopy, right: right.deepCopy)
    }

    func calculateMagnitude() -> Int {
        return 3 * left.getMagnitude() + 2 * right.getMagnitude()
    }
    
    func isLiteraVal() -> Bool {
        if case .val = left {
            return true
        }
        if case .val = right {
            return true
        }
        return false
    }
    
    var ordered: [SnailfishPair] {
        var leftOrdered: [SnailfishPair] {
            if case let .fish(pair) = left {
                return pair.ordered
            }
            return []
        }
        
        var rightOrdered: [SnailfishPair] {
            if case let .fish(pair) = right {
                return pair.ordered
            }
            return []
        }
        
        var newArray: [SnailfishPair] = []
        newArray.append(contentsOf: leftOrdered)
        newArray.append(contentsOf: [self])
        newArray.append(contentsOf: rightOrdered)
        return newArray
    }
}

enum Fish: Equatable {
    case val(Int)
    case fish(SnailfishPair)
        
    func getMagnitude() -> Int {
        switch self {
        case .fish(let snailfish):
            return snailfish.calculateMagnitude()
        case .val(let value):
            return value
        }
    }
    
    var deepCopy: Self {
        switch self {
        case .val:
            return self
        case .fish(let snailfish):
            return .fish(snailfish.copy)
        }
    }
    
    func getString() -> String {
        switch self {
        case .val(let value):
            return "\(value)"
        case .fish(let snailfish):
            return snailfish.getString
        }
    }
}

func compute(_ input: inout Substring) -> SnailfishPair {
    input.removeFirst()
    
    var left: Fish
    if input.first == "[" {
        left = .fish(compute(&input))
    } else {
        var number = 0
        while input.first!.isWholeNumber {
            number *= 10
            number += input.removeFirst().wholeNumberValue!
        }
        left = .val(number)
    }
    
    input.removeFirst()
    
    var right: Fish
    if input.first == "[" {
        right = .fish(compute(&input))
    } else {
        var number = 0
        while input.first!.isWholeNumber {
            number *= 10
            number += input.removeFirst().wholeNumberValue!
        }
        right = .val(number)
    }
    
    input.removeFirst()
    
    return SnailfishPair(left: left, right: right)
}

extension Substring {
    mutating func popFirst(_ count: Int) -> Self {
        let result = self.prefix(count)
        self = self.dropFirst(count)
        return result
    }
}

func explode(_ pair: SnailfishPair, top: SnailfishPair) -> Bool {
    
    guard
        pair.level >= 4, case .val( _) = pair.left, case .val( _) = pair.right
    else {
        return false
    }
    
    let allNodes = top.ordered
    if let next = allNodes.drop(while: { $0 != pair }).dropFirst().first(where: { $0.isLiteraVal() }) {
        if case let .val(value) = next.left {
            if case .val(let rightValue) = pair.right {
                next.left = .val(value + rightValue)
            }
        }
        else if case let .val(value) = next.right {
            if case .val(let rightValue) = pair.right {
                next.right = .val(value + rightValue)
            }
        }
    }
    if let previous = allNodes.reversed().drop(while: { $0 != pair }).dropFirst().first(where: { $0.isLiteraVal() }) {
        if case let .val(value) = previous.right {
            if case .val(let leftValue) = pair.left {
                previous.right = .val(value + leftValue)
            }
        }
        else if case let .val(value) = previous.left {
            if case .val(let leftValue) = pair.left {
                previous.left = .val(value + leftValue)
            }
        }
    }
    
    if case .fish(pair) = pair.previous?.left {
        pair.previous?.left = .val(0)
    } else {
        pair.previous?.right = .val(0)
    }
    return true
}

func split(_ pair: SnailfishPair) -> Bool {
    
    if case let .val(value) = pair.left, value >= 10 {
        pair.left = .fish(
            SnailfishPair(
                left: .val(Int((Double(value) / 2.0).rounded(.down))),
                right: .val(Int((Double(value) / 2.0).rounded(.up)))
            )
        )
        return true
    }
    else if case let .val(value) = pair.right, value >= 10 {
        pair.right = .fish(
            SnailfishPair(
                left: .val(Int((Double(value) / 2.0).rounded(.down))),
                right: .val(Int((Double(value) / 2.0).rounded(.up)))
            )
        )
        return true
    }
    return false
}

func reduce(_ root: SnailfishPair) -> Bool {
    for pair in root.ordered {
        if explode(pair, top: root) {
            return true
        }
    }
    
    for pair in root.ordered {
        if split(pair) {
            return true
        }
    }
    
    return false
}

func reduceAll(_ root: SnailfishPair) {
    while(reduce(root)) {}
}

func partOne() {
    var inputSubstring = input.split(separator: "\n")[0]
    var root = compute(&inputSubstring)
    reduceAll(root)
    
    for line in input.split(separator: "\n").dropFirst() {
        var copy = line
        let newRule = compute(&copy)
        root = SnailfishPair(left: .fish(root), right: .fish(newRule))
        reduceAll(root)
    }
    
    print("\(root.calculateMagnitude())")
}

func partTwo() {
    
    var fishes: [SnailfishPair] = []
    for line in input.split(separator: "\n") {
        var input = line
        let fishPair = compute(&input)
        fishes.append(fishPair)
        
    }
    
    var maxMagnitude = Int.min
    
    for snailfish in fishes {
        for rhs in fishes {
            
            if snailfish == rhs {
                continue
            }
        
            let root = SnailfishPair(
                left: .fish(snailfish.copy),
                right: .fish(rhs.copy)
            )
            
            reduceAll(root)
            let mag = root.calculateMagnitude()
            if mag > maxMagnitude {
                maxMagnitude = mag
            }
        }
    }
    
    print("\(maxMagnitude)")
}


partOne()
partTwo()

//: [Next](@next)
