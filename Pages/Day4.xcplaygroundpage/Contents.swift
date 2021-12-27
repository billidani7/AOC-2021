//: [Previous](@previous)

import Foundation

extension Array {
  mutating func remove(at indexes: [Int]) {
    for index in indexes.sorted(by: >) {
      remove(at: index)
    }
  }
}

let matrixSize = 5

let bundleURL = Bundle.main.url(forResource: "Day4", withExtension: "txt")
let contentsOfFile = try? String(contentsOfFile: bundleURL!.path, encoding: .utf8)

let numbers = contentsOfFile!.split(separator: "\n").first!.split(separator: ",").map { Int($0)! }

let boardBlocks = contentsOfFile!.drop(while: { $0 != "\n" }).dropFirst().components(separatedBy: "\n\n")

let initialBoards = boardBlocks.map { block -> Board in
    var board = Board(numbers: [:], markedNumbers: [])
    block.split(separator: "\n").enumerated().forEach { rowIndex, line in
        line.split(separator: " ").compactMap({ Int($0) }).enumerated().forEach { columnIndex, value in
            board.numbers[Index(x: rowIndex, y: columnIndex)] = value
        }
    }
    return board
}


print(boardBlocks)

struct Index: Hashable {
    let x: Int
    let y: Int
}

struct Board {
    var numbers: [Index: Int]
    
    var markedNumbers: Set<Int>
    var lastNumber: Int?
    
    init(numbers: [Index: Int], markedNumbers: Set<Int>, lastNumber: Int? = nil) {
        self.numbers = numbers
        self.markedNumbers = markedNumbers
        self.lastNumber = lastNumber
    }
    
    mutating func insert(marked number: Int) {
        markedNumbers.insert(number)
        lastNumber = number
    }
    
    func score() -> Int? {
        var hasWon = false
    
        for i in stride(from: 0, to: matrixSize, by: 1) {
            if hasWon { break }
            
            var indexes: [Index] = []
            for y in stride(from: 0, to: matrixSize, by: 1) {
                indexes.append(Index(x: i, y: y))
            }
            
            if indexes.allSatisfy({ markedNumbers.contains(numbers[$0]!) }) {
                hasWon = true
            }
        }
        
        for y in stride(from: 0, to: matrixSize, by: 1) {
            if hasWon {
                break
            }
            
            var indexes: [Index] = []
            for i in stride(from: 0, to: matrixSize, by: 1) {
                indexes.append(Index(x: i, y: y))
            }
            
            if indexes.allSatisfy({ markedNumbers.contains(numbers[$0]!) }) {
                hasWon = true
            }
        }
        
        if !hasWon {
            return nil
        }
        
        var allNumbers = Set(numbers.values)
        
        for number in markedNumbers {
            allNumbers.remove(number)
        }
        
        
        var total: Int = 0
        for number in allNumbers {
            total += number
        }
        
        return total * lastNumber!
    }
}

func partOne() -> String {
    var boards = initialBoards
    
    for number in numbers {
        
        for i in stride(from: 0, to: boards.count, by: 1) {
            boards[i].insert(marked: number)
        }
        
        let scores = boards.compactMap({ $0.score() })
        if let score = scores.first {
            return "\(score)"
        }

    }
    
    return ""
}

func partTwo() -> String {
    var boards = initialBoards
    
    for number in numbers {
        for i in stride(from: 0, to: boards.count, by: 1) {
            boards[i].insert(marked: number)
        }
        
        if boards.count == 1 {
            if let score = boards.first?.score() {
                return "\(score)"
            }
        }
        
        var indexesToBeRemoved: [Int] = []
        for i in stride(from: 0, to: boards.count, by: 1) {
            if boards[i].score() != nil {
                indexesToBeRemoved.append(i)
            }
        }
        
        boards.remove(at: indexesToBeRemoved)

    }
    
    return ""
}

partOne()
partTwo()


