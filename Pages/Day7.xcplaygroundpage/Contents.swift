//: [Previous](@previous)

import Foundation

let input = """
16,1,2,0,4,2,7,1,2,14
"""
let numbers = input.split(separator: ",").map { Int($0)! }

let min = numbers.min()
let max = numbers.max()

func partOne() {
    
    let fuelCost = (min!...max!).map { i in numbers.map{ abs($0 - i) }.reduce(0, +) }.min()
    
    print(fuelCost!)

}



//func partTwo() {
//
//    let fuelCost = (min!...max!).map { i in numbers.map { abs($0 - i) * abs($0 - i) + 1 / 2 }.reduce(0, +) }.min()
//
//    print(fuelCost)
//}

partOne()
//partTwo()


//: [Next](@next)
