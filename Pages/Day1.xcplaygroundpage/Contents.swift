import UIKit

let testData: [Int] = ["199","200","208","210","200","207","240","269","260","263"].map { Int($0)!}


if let bundleURL = Bundle.main.url(forResource: "aoc-day1", withExtension: "txt"),
   let contentsOfFile = try? String(contentsOfFile: bundleURL.path, encoding: .utf8) {
    let components: [Int] = contentsOfFile.components(separatedBy: .newlines).map { Int($0)!}
    print(components.count)
    
    var subsequenceTotals: [Int] = []
    for index in 0..<components.count {

        if (index + 2) < components.count {
            let subsequenceTotal = components[index...index+2].reduce(0, +)
            subsequenceTotals.append(subsequenceTotal)
            print(subsequenceTotal)
        }
    }
    
    var counter = 0
    for index in 1..<subsequenceTotals.count {
        
        if subsequenceTotals[index] > subsequenceTotals[index - 1] {
            counter += 1
            
        }
    }
    print(counter)
}

