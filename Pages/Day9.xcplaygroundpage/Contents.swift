//: [Previous](@previous)

import Foundation

let input = """
1234
1234
"""

struct Board {
    var numbers: [Point: Int]
}

var board = Board(numbers: [:])

input.split(separator: "\n").enumerated().forEach { row, line in
    line.compactMap({ Int(String($0)) }).enumerated().forEach { column, value in
        board.numbers[Point(row: row, column: column)] = value
    }
}

let lowPoints = board.numbers.filter { point, height in
    point.neighbours.allSatisfy {
        guard let neighbour = board.numbers[$0] else { return true }
        return neighbour > height
    }
}

let sum = lowPoints
    .map { $0.value + 1 }
    .reduce(0, +)
    .description

print(sum)

func partTwo() {
    
    var basinSizes: [Int] = []
    lowPoints.forEach { point, height in

        var basin: Set<Point> = [point]
        var pointsToVisit: Set<Point> = [point]

        while pointsToVisit.isEmpty == false {
            var pointsNew: Set<Point> = Set()
            for pointToVisit in pointsToVisit {
                pointsNew = pointToVisit.neighbours.filter { neighbour in
                    if board.numbers[neighbour] == nil {
                        return false
                    }
                    else if basin.contains(neighbour) {
                        return false
                    }
                    return board.numbers[neighbour] != 9
                }

            }
            pointsToVisit = Set(arrayLiteral: pointsNew).union()

            basin.formUnion(pointsToVisit)
        }
        basinSizes.append(basin.count)

    }

    let basinSizesSorted = basinSizes.sorted()
    
    var bs = 1
    for i in 0..<3 {
        bs = bs * basinSizesSorted[i]
    }
    
    print(bs)

}

partTwo()

extension Sequence {
    func union<T>() -> Set<T> where Element == Set<T> {
        var sum = Set<T>()
        for item in self {
            sum.formUnion(item)
        }
        return sum
    }
}

struct Point: Hashable {
    let row: Int
    let column: Int
    
    var neighbours: Set<Point> {
            [
                Point(row: row, column: column + 1),
                Point(row: row, column: column - 1),
                Point(row: row + 1, column: column),
                Point(row: row - 1, column: column)
            ]
        }
}

//: [Next](@next)
