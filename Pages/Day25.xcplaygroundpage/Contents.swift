//: [Previous](@previous)

import Foundation

let input = """
v...>>.vv>
.vv>>.vv..
>>.>v>...v
>>v>>.>.v.
v>v.vv.v..
>.>>..v...
.vv..>.>v.
v.v..>>v.v
....v..v.>
"""

struct Point: Hashable {
    var x: Int
    var y: Int
}
var south: Set<Point> = []
var east: Set<Point> = []

let columnsCount = input.split(separator: "\n")[0].count
let rowsCount = input.split(separator: "\n").count


let lines = input.split(separator: "\n")

var y = 0
for line in lines {
    line.enumerated().forEach { x, char in
        
        if char == ">" {
            east.insert(Point(x: x, y: y))
        }
        else if char == "v" {
            south.insert(Point(x: x, y: y))
        }
    }
    y += 1
}

func isAvailable(_ point: Point) -> Bool {
    if east.contains(point) == false,
       south.contains(point) == false {
        return true
    }
    return false
}

var step = 0

while true {
    
    step += 1
    
    var moved = false

    let newEast = Set(
        east.map { point -> Point in
            let nextPoint = Point(x: (point.x + 1) % columnsCount, y: point.y)

            if isAvailable(nextPoint) {
                return nextPoint
            }
            return point

        }
    )
    
    if newEast != east {
        east = newEast
        moved = true
    }
    
    let newSouth = Set(
        south.map { point -> Point in
            let nextLocation = Point(x: point.x, y: (point.y + 1) % rowsCount)
            
            if isAvailable(nextLocation) {
                return nextLocation
            }
            else {
                return point
            }
        }
    )
    
    if newSouth != south {
        south = newSouth
        moved = true
    }
    
    if !moved {
        print("\(step)")
        break
    }
}


//: [Next](@next)
