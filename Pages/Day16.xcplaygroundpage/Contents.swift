//: [Previous](@previous)

import Foundation

let input = """
A0016C880162017C3686B18A3D4780
"""

func convertToBinary(decimal: Int) -> [Bool] {
    var result: [Bool] = []
    var num = decimal
    while num > 0 {
        let modulo = num % 2
        if modulo == 1 {
            result.append(true)
        }
        else{
            result.append(false)
        }
        
        num = num / 2
    }
    result.append(contentsOf: Array(repeating: false, count: 4 - result.count))
    return result.reversed()
}

struct Packet {
    var subpackets: [Packet] = []
    
    var typeId: Int
    
    var version: Int
    
    var result: Int

    var versionTotal: Int {
        var total = 0
        for item in subpackets {
            total += item.versionTotal
        }
        return version + total
    
    }

}

let bits = input
    .map { $0.hexDigitValue! }
    .flatMap { convertToBinary(decimal: $0) }

func parse(bits: inout ArraySlice<Bool>) -> Packet {
    var bitString: String = ""
    for _ in 0..<3 {
        let bit = bits.popFirst()

        bitString.append(bit! ? "1" : "0")
        
    }

    let version = Int(bitString, radix: 2)

    bitString = ""
    for _ in 0..<3 {
        let bit = bits.popFirst()

        bitString.append(bit! ? "1" : "0")
        
    }

    let id = Int(bitString, radix: 2)
    
    if id == 4 {
        var literalBits: [Bool] = []
        while bits.first != false {
            literalBits.append(contentsOf: bits.popFirst(5).dropFirst())
        }
        literalBits.append(contentsOf: bits.popFirst(5).dropFirst())
        
        var bitString: String = ""
        for i in 0..<literalBits.count {
            let bit = literalBits[i]
            bitString.append(bit ? "1" : "0")
        }
        
        return Packet(
            typeId: id!,
            version: version!,
            result: Int(bitString, radix: 2)!
        )
    }
    
    var subpackets: [Packet] = []
    
    let lengthId = bits.removeFirst()
    if lengthId {
        var numberOfSubpacketsBits = bits.popFirst(11)
        
        var bitString: String = ""
        for _ in 0..<numberOfSubpacketsBits.count {
            let bit = numberOfSubpacketsBits.popFirst()

            bitString.append(bit! ? "1" : "0")
        }
        
        let numberOfSubpackets = Int(bitString, radix: 2)!
        
        for _ in 0 ..< numberOfSubpackets {
            subpackets.append(parse(bits: &bits))
        }
    } else {
        var subpacketLengthBits = bits.popFirst(15)
        
        var bitString: String = ""
        for _ in 0..<subpacketLengthBits.count {
            let bit = subpacketLengthBits.popFirst()

            bitString.append(bit! ? "1" : "0")
        }
        
        let subpacketLength = Int(bitString, radix: 2)!
        
        let targetCount = bits.count - subpacketLength
        while bits.count != targetCount {
            subpackets.append(parse(bits: &bits))
        }
    }
    
    var values: [Int] = []
    for item in subpackets {
        values.append(item.result)
    }
    
    var result = 0
    if id == 0 {
        result = values.reduce(0, +)
    }
    else if id == 1{
        result = values.reduce(1, *)
    }
    else if id == 2 {
        result = values.min()!
    }
    else if id == 3 {
        result = values.max()!
    }
    else if id == 5 {
        if values[0] > values[1] {
            result = 1
        }
        else {
            result = 0
        }
    }
    else if id == 6 {
        if values[0] < values[1] {
            result = 1
        }
        else {
            result = 0
        }
    }
    else if id == 7 {
        if values[0] == values[1] {
            result = 1
        }
        else {
            result = 0
        }
    }
    
    return Packet(
        subpackets: subpackets,
        typeId: id!,
        version: version!,
        result: result
    )
    
}

var bitSlice = ArraySlice(bits)

let packet = parse(bits: &bitSlice)

func partOne() {
    print(packet.versionTotal.description)
    
}

func partTwo() {
    print(packet.result.description)
}

extension ArraySlice {
    mutating func popFirst(_ count: Int) -> Self {
        let result = self.prefix(count)
        self = self.dropFirst(count)
        return result
    }
}

partOne()
partTwo()

//: [Next](@next)
