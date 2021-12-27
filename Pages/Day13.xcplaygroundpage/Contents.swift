//: [Previous](@previous)

import Foundation

let input = """
6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5
"""

struct Point: Hashable {
    var x: Int
    var y: Int
}

let emptyLine = input.components(separatedBy: "\n").firstIndex(where: {$0 == ""})

var coords: [Point] = input.components(separatedBy: "\n")[0..<emptyLine!].map{ coord -> Point in
    let x = Int(coord.split(separator: ",").first!)!
    let y = Int(coord.split(separator: ",").last!)!
    
    return Point(x: x, y: y)
    
}

var coordsSet = Set(coords)

let instructions = input.components(separatedBy: "\n").dropFirst(emptyLine!+1)

instructions.enumerated().forEach { no, fold in
    let instruction = fold.components(separatedBy: " ").last?.components(separatedBy: "=")
    
    let loc = Int(instruction!.last!)!
    
    var pointsAfterFold: Set<Point>  = []
    
    for coord in coordsSet {
        if instruction?.first! == "y" {
        
            if coord.y < loc  {
                pointsAfterFold.insert(Point(x: coord.x, y: coord.y))
            }
            else {
                pointsAfterFold.insert(Point(x: coord.x, y: loc - (coord.y - loc)))
            }
        }
        else if instruction?.first! == "x" {
            if coord.x < loc {
                pointsAfterFold.insert(Point(x: coord.x, y: coord.y))
            }
            else {
                pointsAfterFold.insert(Point(x: loc - (coord.x - loc), y: coord.y))
            }
            
        }
    }
    
    coordsSet = pointsAfterFold
    if no == 0 {
        print(coordsSet.count)
    }
}

var grid: [Point] = []

for y in 0..<10 {
    var line = ""
    for x in 0..<40 {
        if (coordsSet.first(where: {$0.x == x && $0.y == y}) != nil) {
            line.append("#")
        }
        else {
            line.append(".")
        }
    }
    print(line)
}

//: [Next](@next)
