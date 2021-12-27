//: [Previous](@previous)

import Foundation

let bundleURL = Bundle.main.url(forResource: "Day6", withExtension: "txt")
let contentsOfFile = try? String(contentsOfFile: bundleURL!.path, encoding: .utf8)
let components: [String] = contentsOfFile!.components(separatedBy: ",")

var lanternfish = components.map{ Int($0)! }

func partOne() {
    var timers = Array(repeating: 0, count: 9)

    for num in lanternfish {
        timers[num] += 1
    }

    for _ in 0..<80 {
        let newLanternfish = timers.removeFirst()
        timers.append(newLanternfish)
        timers[6] += newLanternfish
    }

    print(timers.reduce(0, +))
}

func partTwo() {
    var timers = Array(repeating: 0, count: 9)

    for num in lanternfish {
        timers[num] += 1
    }

    for _ in 0..<256 {
        let newLanternfish = timers.removeFirst()
        timers.append(newLanternfish)
        timers[6] += newLanternfish
    }

    print(timers.reduce(0, +))
}

partOne()
partTwo()


//: [Next](@next)
