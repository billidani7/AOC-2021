//: [Previous](@previous)

import Foundation

var input = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""

let data = input.split(separator: "\n").map { $0.compactMap { Int(String($0)) } }

struct Point: Hashable {
    var y: Int
    var x: Int
}

func neighborPoints(point: Point, width: Int, height: Int) -> [Point] {
    return [
        Point(y: point.y - 1, x: point.x),     // top
        Point(y: point.y - 1, x: point.x + 1), // top right
        Point(y: point.y, x: point.x + 1),     // right
        Point(y: point.y + 1, x: point.x + 1), // bottom right
        Point(y: point.y + 1, x: point.x),     // bottom
        Point(y: point.y + 1, x: point.x - 1), // bottom left
        Point(y: point.y, x: point.x - 1),     // left
        Point(y: point.y - 1, x: point.x - 1)  // top left
    ].filter { $0.y >= 0 && $0.y < height && $0.x >= 0 && $0.x < width }
}

func step(_ matrix: inout [[Int]]) -> Int {
    let dx = matrix.count
    let dy = matrix[0].count
    
    for row in 0..<dy {
        for column in 0..<dx {
            matrix[row][column] += 1
        }
    }
    
    var flashes = Set<Point>()
    var flashNeighborPoints: [Point] = []
    
    for row in 0..<dy {
        for column in 0..<dx {
            if matrix[row][column] <= 9 {
                continue
            }

            let flashPoint = Point(y: row, x: column)
            flashes.insert(flashPoint)
            
            flashNeighborPoints.append(contentsOf: neighborPoints(
                                        point: flashPoint,
                                        width: dx,
                                        height: dy)
            )
        }
    }
    
    while !(flashNeighborPoints.count == 0) {
        let neighbor = flashNeighborPoints.removeFirst()
        matrix[neighbor.y][neighbor.x] += 1
        
        if matrix[neighbor.y][neighbor.x] > 9 && !flashes.contains(neighbor) {
            flashes.insert(neighbor)
            
            flashNeighborPoints.append(contentsOf: neighborPoints(
                                        point: neighbor,
                                        width: dx,
                                        height: dy)
            )
        }
    }
    
    var flashCount = 0
    
    for row in 0..<dy {
        for column in 0..<dx {
            if matrix[row][column] > 9 {
                matrix[row][column] = 0
                flashCount += 1
            }
        }
    }
    
    return flashCount
}

func partOne() {
    var matrix = data
    var flashCount = 0
    for _ in 0..<100 {
        flashCount += step(&matrix)
    }
    print("\(flashCount)")
}

func partTwo() {
    
    var matrix = data
    let width = matrix.count
    let height = matrix[0].count
    // run steps until all flash
    var stepCount = 0
    while step(&matrix) != width * height {
        stepCount += 1
    }

    print("\(stepCount + 1)")
}

partOne()
partTwo()


//: [Next](@next)
