//: [Previous](@previous)

import Foundation

var maxY = -1000
var count = 0

let targetXrange = 201...230
let targetYrange = -99 ... -65

struct Point: Hashable {
    var x: Int
    var y: Int
}

for x in 1...targetXrange.upperBound {
    for y in targetYrange.lowerBound...1000 {
        var position = Point(x: 0, y: 0)
        var velocity = Point(x: x, y: y)

        var tempMaxY = Int.min

        while position.x <= targetXrange.upperBound,
              position.y >= targetYrange.lowerBound {
            
            position.x += velocity.x
            position.y += velocity.y

            if velocity.x > 0 {
                velocity.x -= 1
            }
            else if velocity.x < 0 {
                velocity.x += 1
            }

            velocity.y -= 1

            if position.y > tempMaxY    {
                tempMaxY = position.y
            }

            if targetXrange.contains(position.x),
               targetYrange.contains(position.y) {

                if tempMaxY > maxY {
                    maxY = tempMaxY
                }

                count += 1
                
                break
            }
        }
    }
}


print("\(maxY)")
print("\(count)")


//: [Next](@next)
