//: [Previous](@previous)

import Foundation

let input = """
1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581
"""

struct Point: Hashable {
    var x: Int
    var y: Int
    
    var near: [Point] {
        [
            Point(x: x + 1, y: y),
            Point(x: x, y: y + 1),
            Point(x: x - 1, y: y),
            Point(x: x, y: y - 1),
        ]
    }
}

var matrix: [Point: Int] = [:]

var matrixSize = input.split(separator: "\n").count

input.split(separator: "\n").enumerated().forEach { rowIndex, line in
        line.enumerated().forEach { x, char in
            matrix[Point(x: x, y: rowIndex)] = char.wholeNumberValue!
        }
    }

func calculateWeights(
    in grid: [Point: Int],
    from start: Point,
    to end: Point
) -> Int {
    
    var minWeights: [Point: Int] = [:]
    
    var currentPosDict: [Point: Int] = [start: 0]
    
    while let (position, weight) = currentPosDict.min(by: { $0.value < $1.value }) {
        currentPosDict.removeValue(forKey: position)
        
        guard weight < minWeights[end] ?? .max else { continue }
        
        var nextPositions = position.near
        if nextPositions.contains(end) {
            nextPositions.removeAll(where: { $0 == end })
            minWeights[end] = min(minWeights[end] ?? .max, weight + grid[end]!)
        }
        
        nextPositions.forEach { nextPosition in
            
            if let nextPositionCost = grid[nextPosition] {
                let totalWeight = weight + nextPositionCost
                if
                    let previousCost = minWeights[nextPosition],
                    previousCost <= totalWeight {
                    return
                }

                minWeights[nextPosition] = totalWeight

                currentPosDict[nextPosition] = totalWeight
            }
            else {
                return
            }
        }
    }
    
    return minWeights[end]!
}

func partOne() {
    
    let startPoint = Point(x: 0, y: 0)
    let endPoint = Point(
        x: matrixSize - 1,
        y: matrixSize - 1
    )
    
    print("\(calculateWeights(in: matrix, from: startPoint, to: endPoint))")
}

func partTwo() {
    
    var newMatrix: [Point: Int] = [:]

    for x in 0..<5 {
        for y in 0..<5 {
            for (point, cost) in matrix {
                let newPoint = Point(
                    x: (matrixSize * x) + point.x,
                    y: (matrixSize * y) + point.y
                )
                var newWeight = 0
                let currWeight = cost + x + y
                if currWeight > 9 {
                    newWeight = currWeight % 9
                }
                else {
                    newWeight = currWeight
                }
    
                newMatrix[newPoint] = newWeight
            }
        }
    }
    
    let startPoint = Point(x: 0, y: 0)
    let endPoint = Point(
        x: matrixSize * 5 - 1,
        y: matrixSize * 5 - 1
    )
    
  print("\(calculateWeights(in: newMatrix, from: startPoint, to: endPoint))")
}

partOne()
partTwo()

//: [Next](@next)
