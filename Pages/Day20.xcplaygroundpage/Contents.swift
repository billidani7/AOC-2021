//: [Previous](@previous)

import Foundation

let input = """
####...###.###.##.##.##..###..##.#.##.#...####..##...#..#..#....#..#..##.##..#.#.####.######.#..#.##..##....#.####.##...#.#..#.####.#.#.#..###.##..#.#.#.#...#.....###.#.#...#..#....#######....#..#...###.##.........#.#.##.#........##...#..##.......####.#.#.#.#.#.####..#..........#.##......##......###.#..##.#.#.....###.#..#...###.##........#..#.##.#.###.#..#####..##..#..#.#.#...###..##..#.###.##...#.##.#.....#.#..........#..##.#########.#.#..##.#.##..######.....####...###..###.#..##########.#.#.....###.##.##.

#.#...#..##..########...##....#.#.###.#.##.##...#..###.#.##.#.#..#..##..###....#..##.##....#...##.#.
.###.#..#.#.#..##.##.#.####..##.#...#.###...#.#....#.#.###..#.#..###...##..######..#..#..#####......
##.#.###.#.#..###...##..###.#.#..#....#...#..#.....##..###.###.######.####.#.#...##.#.##.####..#.##.
...#..##...########.##..#..#...#...#...##.#..#.#..#.##..##.#..#...#.##........#.#.#.######..#..#.#..
.....###....#.##....####..#.#.#.###.###.##.#.#.###..#..##.#...##.###..#.##..##.##..#.#....####..#.#.
..####..###.#..###.#.....#..#..#....#########.####.#..#.##.##..#....#.....#.#.#..#.#..#..###.##...##
###.#..#####...####.##...####...#.#####.##...##.####.###...###...##...#..#.#.######.##....#....##..#
...#...#.#.###..#.#..#.#.####..####.#..#...#...#.#...#...#.....##..#.....#.#.#....#####.##..#.#..###
##...##..###..#..#...#..#..#.####...#.##.###.#.#....#..##....#.....#.##.###.###.#.....#####.#...#...
.##.#..#..#..#.##.#.##.###.###....##.#.#...#####.#..##..#....###..#.#...##.###.#..#.####..##..######
#.#..####.###.#####.###.##....##..####.##.##.#########.........#.#.....####.##.....#.#...##.#....##.
.#..#.#.#..#.#.#.#.#..###....##.#.##.#....#.##.#....#####.#..###...##......#..#.#.##..##..######..##
..##.####.##.....#.#######..##.##...##.####.####.##...####..#.###....#..###..##..#.####....###..##..
#.#....#...#.#.#..#.#..#...#####..#.#..###.#.##...#####.....##.#....#.#.##.#..#.#..###...#.#.#..#..#
##.#.#..#.###.###.##.####....###.#.##.#.#.##...###.##.#.#...##.#.##..#.##.##.#.#....#.....#.#.###...
.#.##.#....#.#.#.###.##..#######.###..#...#...#####.###.#.#.###..###...###.######.#.#....#...#####.#
####..#..####.#......####..##...####...##.#.######.###.###.#.#.#.#....##.#######....##.#..####..##.#
..##.#..###...##....##.###.#.#.#....#..##..###..##..##..#.####..#....#.#.####..#..##.#..#....#..##.#
.#..#.#..##.###....#...####...##.##..#.#..##.##.##.###....##...##.....#.###......###..#.#..###....#.
###.#...#.##...####.#.##.###..#.....##.#.#...#.#..###.##..###.#..#.#.#.#.#####.#.####.##..####..##..
.....#.#..#.##...#..#.....#.###.##########.##.....#..####.##.##.###.##..#.##..#....#.#..##...###.#..
#..#.##.#.#.#..#....##########.###..#.#...#.##...#####..#..##..#..####.......###..#..#.###..###.##.#
###.#..##..##..####...#.####..##.######....#..#...#..##...#####.####.##.####...######..#..##...##..#
..##.#####...#.##..###...###.#......#.#.######.#...####.####.##.##....##..##.#.#..####.#####.######.
..##..#.#..###..#.....####..#.####.##.#.####.##.....####..##..#...###.#...###...#.#.#........##...#.
.#.###.##.##.#.##.##..#.#.###...##..#..#..#.##.#.#..##.#.#.#.##....##....#.#......#....#..#....##.#.
#####.#.###...###.#..#.##.###...###.##.##........#.###.#...##.###.#...###.##.##..#.##.###..####.###.
#....####.#..#.###....##.#.##..##.....#..#...#...##.#..#.#...#..##.#..##..######.##..####.##...#.#..
..#.#..#..##.##...##.###...#...###..#.##..#.#####..#.#.##.#######.##.#.#..##..####.....#####..#.#.##
#.#.....#.#.##.##.##.##......#...##.##.###..#...#.#........##....#.#.....#.##.###....#..###..#..#.##
..#.#.####..#.##...#.###.##....#.##.#########.###...##...##.#.#....#...#...##.....###.##.........#..
###.##.#.#...#...##...##...##.##.#..#.#....##.#.##..#..##.#.##.##..#.#.####.###.#.##.##....#.###.##.
###..#.######.#.###.##.###..##.#..######..###.....###......#.##..##..#.....##..##.##..#.#....##.##.#
..##.#....#.........##.##.#.#..####..##.#......#....#...##.#####..##........##....#.###...###.###..#
##...###.#.#..#.#..##.#.##.####....###....##.#####.##....#.##...##..#.....#....#...######..#.#...###
.##.##.#..###.#.###.#.#.###...####.##.#.#.#.####.#...####.##..###.#...##..##.####..###.#.#..##..##..
#..#...#####.##...#...##..###.#.#....#.#...#########..##.....##.#.#...###......#.##.########..#.##..
##..##.##.......##..##........###.#....#.####.#..#.#.###....#.#.#.#.###.#.#..##..##...##.#.....#....
....#..##...#####...##..#.###....##.##..##.#....#....#..#.#...#.#####...#..##.#.##...#.#...####...##
..##..####.##....#.###.####...###.#.##.##...#..##..#.###.###.#.#.######.#..#####......##..#.###.#.#.
#..#.#....#...###.#.#....##.###..#....##..####.#..#.#####.#.###.######...#..###.##..####.#...##.#..#
..#.##.##.#.##........#..##.....#.#.#.#.##.##..#..##...#.##...#...#.##.###..###.....##..#....#.#..##
###.##...##.#.#...##...####.###.#...####..###...#.##.#..#.#.###......#.#...###..#.####.##.#.#.####..
#.#.##.##...#..##..#....#.##..##......###..###...####..##...###.#.##.##..##...####.#.....#.##.##...#
.....#...#.##.#..#.##.#.####.#######......##.#..#...##..#...#.###.###.#.##.#.##..#.##.##.#..#.###..#
####...#####..##....##.#####...#...#...##.....##..###..#...###..#...#...##.###..###.#####...##.#....
#..###...###....#.#.#.######.###..####..#####...###..###..###....##.#.##..#.##..##..#.###.#####.....
#.#.##.#.####..#####.###.#..#####.#..#.#.#..#.##....##.#.#.#.#.###.###..###...#####.#.##.#.#.#..#...
.#.#...#..#.##.#..####..###.#..#.########.####......#...##..#####..#...#.#..###..#.#....####....#..#
##.###.###..#..##.#..#...#..####..#.###..##....#.#...######.##....##...#....#.........####.#.###.#..
.##..####.##.#.#..####...#.##..##.##..###...#.....##...#......#....##...#####..#####.#.#.#...#..##..
.#...##.#.###.#.#.##....###..###.##.#.##.....###.####.......#.#.#.#....##.#..#..#..#####..#....#.#.#
..#.##.###.###.................###.#...#...#.##.#.###..###..#..##..#.#..###..##.#.##.#.##.##.##.#...
###.#...#..#...###.......###.#.#..#####.####.#..#...##...#####..#........###.#..#.#######..####.#.##
...#.##.#####.#...##.###...##.#..#..##.##.##..#.#.#.#.###...#.##..#.##.##.#.#.##...##.###....#..#.##
##.#.####.##.#..#####.#.#...######.###.#.#.##.##...##.#.##.#..#...##.##.#..#...#..#..#..#..#.##.#...
#.#######.#..#.##..#..#.#..#..####....#.#..#..#...#.....####...#..#.......#..#...##..##.##.##..#.#..
..##.#.####.#.#.#......########..#..#.....###.#.####.#..#####.##..####.#.###....##.#.#..#.##..#####.
.##.#.##.#.#..#.#.#.#...#########...#####..#...###.#.##..##.#..##...###.##.#.#.#.#...####.#.#.####.#
.#####.####..##.##....#.#.#...######.#.#..#.#.#....#.#....##.#..#.###..#..#.####...###..##.#.#.#.#..
.##..#..###.######.#.#.#..######.##..#..#.######....###.##..#####.....####.#.#.#...##.###.#...##.##.
.#.####..##.#..#.#..#.###.##.#....##..#.#..#####.##.##...#..####..###..#........#.##..##.####...###.
..##..###.#.###.#...##.#.##.##.#######..##.#....#.####.#...####...####.###.##.##...##.#..#.#....#..#
.##..#.######..#.#.##.....######.#####......###.#....###.##.#.###.#..#.#.###.#.####...####.##.....##
.####....#.##.##.#.#....#.##.#..#...##.....#..##......#..#######..#.##.###.#..#.###.####..###.#.#..#
..#.##.#.#..##..####....#######.##...#.##.....#.#.##....#.###.#.#..#.###.#.....#.####.#.....##.#...#
##...#.##..##.#.........#..#..#######.##.#..###.#.###..#.##.#..#...#..#..#.##.##.#..###.###...##.##.
...#.#..###..#.##.#####.#.##...#.##..###.#...#...#.##....#####..#####....###..#.####.#...#.###.....#
..#.####..#..#.#..#.######...##.##...##...#.#.#.....#..#...##..#.############.###.####....###..###..
#.#...#.#.##..##..#.#..#...####.##.##.#.#.#.##..##.#.#.....#....#...#...#.###.#.#####..##.###...#..#
.#....#.##..###.#..#.###.#..#.#..##..##.......########.#...#...#####.#...#..#..##.....#.##.....####.
#.#####.#.##.###.#.#....#.#.###...##.#.....##..##..#.#####..#.#.##.#..###..##...#.#.##.#.#.....#.#..
..###...#.#.......#.#......##.#..#.#.#.#.#...#.###.##...####....######......#...#####..###.##...#..#
#..#...#..##..#...#...####.#...#....#####.#...#...#.#.....##...##..#...#....#..#####...#.....##...#.
#.####.#...#...#..##...##....#...#.#.##.##.##...##..##.#..#..#.##.##.##.#.##......#.#...##.....#...#
.#..####..###........#####...#....#.####..##..#####.##.###..#..###...##..##...##.....#..#.#.###.#...
.#....#.####....#....##..#.#.######.#######.#.##.###.###...#.#....##..#..####.###.#....###...#.#....
...###..##.#.##..#.#.#####.######.#..######.##...#.##.#..##.###.#.......#..#...#.###...##..####.##.#
#....###....#..#####.#..#...###..##.##...##.###...#...#....#..#...#..####.#.####...#..##....#...#.##
#.####.###...#..#.####...#..#.##.###.#.##.#....#..##.#.#...##.#..#.##.##..#####..#..#...###...#.####
#.##.##..##.##......#.#.##...###.####.###.####.#...##...#.#...###..###.######.#####....###.####.#...
##..#.###....#.#..###.#..##..###.#..##..#####.#.###..#.#...##.#.#.#.####....##...##....###.#.#.#..##
...#.###.###..###.##...#.###.#.####.##..#.#..###...#..##.######.#.#..###..#.##...##.###....##.#...#.
#..#.#..#.#..#.#.#.#.#..##..#....#..###.###.#...#.#####.#..#..#.#....#.#.#.#....##.##..#...##......#
...#...##....#....#.##.######.#...#.....#.##..#....#..##.#.........###..#..#..#.##.##...#.#..#######
##.##..#..#.#..#.#.######.##...####...#...#..#..##.#......#.#....#.###..#.###...#...#...#.##...###..
#.####.#.##....##..###....#.##.#.##....####.#.#.##.#....#..#..###...#.....##.##....####..###........
..#..##...##.#...#..#.#..###....##...#...####.....####....###..##..##..##.###..#.....######.........
.###.###.##.#...#.##..##.#.##.#.#..#.#..###.#....###.#..##.###....#...#####.###..###.####..#.#...##.
..##.#.#.####.#..#..###.##.#####.#.#....##..#.#.##..##..#...###.#...#...#...#...#..#..##.#...##...##
......###..#####...##..##.#.....###.#...#..###..####..##..#..#####..##..#..##..####.#..#.........#..
###............#.#.......###..#..##..#.#####.#.##.########.##..####.#.########..#.###.....#.####.#.#
.#.....#....##..#.##..#...#.#.##.##..#.##...#.##.#..#......##.....##..##.#..##.###...###....#.##.###
..#...###....##....#.#...###.###..##.##...#.#.#.#..#....###.#.##.....##.#..#.#######.#.###...###....
##.#.#.#.#...####.##..#.#####..######..#.#...#.#.........#....##.....#....#.###....#.#.#..#...##....
.......#.#.#..#....####.##.##.#.......#.#.###..#..#..#..##.#.#.##.#.##.#.#.#..##.#..###..#.###...##.
..##.#.#..##.##...#..#..#..#..###..#.##..#.##..#..#....#....#.##.##.###.##.###..##.......######.###.
##.#.#.#.#.#..###...###..####...##..##.###.#..#..####.#...###..#.##.##.#.#.###..###.#.#.#...###..#..
..##...####......##..#..#..#...#...#..##...######.##......#.#.#....#.#.#.#..#..##.#...#.########...#
####.##.#.#.####..#.#.##.#..#...#.#.##.#....#..#.####.#.#####.###..##.#.####...##.###.#.#....#.#####
"""

func applyAlgo(image: [[Int]], algorithm: [Int], outsideGridValue: Int) -> (image: [[Int]], outsideGridValue: Int) {
    
    let height = image.count
    let width = image[0].count
    
    var newImage: [[Int]] = Array(repeating: Array(repeating: 0, count: width + 2), count: height + 2)
    
    for y in stride(from: 0, to: width + 2, by: 1) {
        for x in stride(from: 0, to: height + 2, by: 1) {
            let algorithmIndex = getIndex(pixel: (x: x - 1, y: y - 1), image: image, outsideGridValue: outsideGridValue)
            let newPixelValue = algorithm[algorithmIndex]
            newImage[y][x] = newPixelValue
        }
    }
    
    let currentOutsideGridValueIndex = getIndex(pixel: (x: 0, y: 0), image: [[]], outsideGridValue: outsideGridValue)
    let newOutsideGridValue = algorithm[currentOutsideGridValueIndex]
    
    return (image: newImage, outsideGridValue: newOutsideGridValue)
}

func getIndex(pixel: (x: Int, y: Int), image: [[Int]], outsideGridValue: Int) -> Int {
    let height = image.count
    let width = image[0].count
    
    var value = 0
    
    for dy in -1...1 {
        for dx in -1...1 {
            if (pixel.x + dx < 0 || pixel.y + dy < 0  || pixel.x + dx >= width || pixel.y + dy >= height) {
                value = (value * 2) + outsideGridValue
            }
            else {
                value = (value * 2) + image[pixel.y + dy][pixel.x + dx]
            }
        }
    }
    
    return value
}

func countBrightPixels(image: [[Int]]) -> Int {
 
    var litCount = 0
    for line in image {
        for pixel in line {
            if pixel == 1 {
                litCount += 1
            }
        }
    }
    return litCount
}


let inputSplit = input
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n\n")

let algorithm = String(inputSplit[0])
    .map { $0 == "#" ? 1 : 0}

var image: [[Int]] = []

for line in inputSplit[1].split(separator: "\n") {
    var linePixel: [Int] = []
    for pixel in String(line) {
        if pixel == "#" {
            linePixel.append(1)
        }
        else {
            linePixel.append(0)
        }
    }
    image.append(linePixel)
}

var outsideGridValue = 0

for _ in 1...50 {
    (image, outsideGridValue) = applyAlgo(image: image, algorithm: algorithm, outsideGridValue: outsideGridValue)
}

let total = countBrightPixels(image: image)
print("total: ", total)
    

//: [Next](@next)
