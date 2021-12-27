//: [Previous](@previous)

import Foundation

let dataset:[String]

let bundleURL = Bundle.main.url(forResource: "Day8", withExtension: "txt")
let contentsOfFile = try? String(contentsOfFile: bundleURL!.path, encoding: .utf8)

dataset = contentsOfFile!.components(separatedBy: .newlines)

func getUnique(str1: String, str2: String) -> String {
    var string = ""
    for ch in str2 {
        if (!str1.contains(ch) ) {
            string = string + String(ch)
        }
    }
    return string
}

func calculate() {

    var patternCount = 0
    var patternSum = 0
    for line in dataset {
        let pattern = line.components(separatedBy: " | ")
        let signals = pattern[0].components(separatedBy: " ")
        let values = pattern[1].components(separatedBy: " ")
    
        
        for value in values {
            if ([2, 4, 3, 7].contains(value.count)) {
                patternCount += 1
            }
        }
        
        var digits:[String] = Array(repeating: "", count: 10)
        digits[1] = String(signals.filter{ $0.count == 2}[0].sorted())
        digits[4] = String(signals.filter{ $0.count == 4}[0].sorted())
        digits[7] = String(signals.filter{ $0.count == 3}[0].sorted())
        digits[8] = String(signals.filter{ $0.count == 7}[0].sorted())
        
        let ch1 = getUnique(str1: digits[1], str2: digits[4])
        
        for signal in signals {
            if (signal.count == 5) {
                let ch2 = getUnique(str1: signal, str2: ch1 )
                if (ch2.count == 0) {  // matches 5
                    digits[5] = String(signal.sorted())
                } else {
                    let ch3 = getUnique(str1: signal, str2: digits[1])
                    if (ch3.count == 1) { // matches 2
                        digits[2] = String(signal.sorted())
                    } else {  // matches 3
                        digits[3] = String(signal.sorted())
                    }
                }
            } else if (signal.count == 6) {  // 0, 6, 9
                let ch2 = getUnique(str1: signal, str2: ch1 )
                if (ch2.count == 1) {   // matchs 0
                    digits[0] = String(signal.sorted())
                } else {
                    let ch3 = getUnique(str1: signal, str2: digits[1])
                    if (ch3.count == 1) {  // matches 6
                        digits[6] = String(signal.sorted())
                    } else {   // matches 9
                        digits[9] = String(signal.sorted())
                    }
                }
            }
        }
        //print output values
        var str = ""
        for value in values {
            let svalue = String(value.sorted())
            // will only match one
            let digit = digits.indices.filter{digits[$0] == svalue}[0]
            str = str + String(digit)
        }
        patternSum += Int(str)!
        //print(str)
    }
    print ("\(patternCount)")
    print ("\(patternSum)")
    
}

calculate()
//: [Next](@next)
