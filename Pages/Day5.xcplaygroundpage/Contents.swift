//: [Previous](@previous)

import Foundation

let bundleURL = Bundle.main.url(forResource: "Day5", withExtension: "txt")
let contentsOfFile = try? String(contentsOfFile: bundleURL!.path, encoding: .utf8)
let components: [String] = contentsOfFile!.components(separatedBy: .newlines)

struct Point: Hashable {
    var x: Int
    var y: Int
}

struct VentLine {
    let ventEndA: Point
    let ventEndB: Point
    
    var points: [Point] = []
    
    init(ventEndA: Point, ventEndB: Point) {
        self.ventEndA = ventEndA
        self.ventEndB = ventEndB
        
        compute()
    }
    
    mutating func compute()  {
        var points: [Point] = []
        
        if ventEndA.x == ventEndB.x {
            for y in stride(from: min(ventEndA.y, ventEndB.y), through: max(ventEndA.y, ventEndB.y), by: 1) {
                points.append(Point(x: ventEndA.x, y: y))
            }
            return self.points = points
        }
        
        if ventEndA.y == ventEndB.y {
            for x in stride(from: min(ventEndA.x, ventEndB.x), through: max(ventEndA.x, ventEndB.x), by: 1) {
                points.append(Point(x: x, y: ventEndA.y))
            }
            return self.points = points
        }
        
        let diff = abs(ventEndA.x - ventEndB.x)
        let isXincreases = ventEndB.x > ventEndA.x
        let isYincreases = ventEndB.y > ventEndA.y
        
        self.points = (0...diff).map {
            return Point(
                x: ventEndA.x + (isXincreases ? $0 : -$0),
                y: ventEndA.y + (isYincreases ? $0 : -$0)
            )
        }
    }
}

let coords = components.map { $0.components(separatedBy: " -> ")}

var lines: [VentLine] = []
for cord in coords {
    let line = cord.map { $0.components(separatedBy: ",")}.flatMap { $0 }

    let ventLine = VentLine(
        ventEndA: Point(x: Int(line[0])!, y: Int(line[1])!),
        ventEndB: Point(x: Int(line[2])!, y: Int(line[3])!)
    )

    lines.append(ventLine)

}

func partTwo() {
    var countPoints: [Point: Int] = [:]
    
    for line in lines {
        for point in line.points {
            countPoints[point, default: 0] += 1
        }
    }
    
    let total = countPoints.filter({ $0.value >= 2 }).count
    print(total)
}

// For part one remove angle calculation in VentLine.compute()
partTwo()

//: [Next](@next)
