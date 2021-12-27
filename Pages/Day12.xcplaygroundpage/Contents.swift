//: [Previous](@previous)

import Foundation

let input = """
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""

class CavePath {
    let isStart: Bool
    let isEnd: Bool
    
    let id: String
    
    let isUppercase: Bool
    
    var neighbors: [CavePath] = []
    
    var isVisited = false
    var visitsCount = 0

    init(id: String) {
        self.id = id

        if id == "start" {
            self.isStart = true
        }
        else {
            self.isStart = false
        }
        
        if id == "end" {
            self.isEnd = true
        }
        else {
            self.isEnd = false
        }
        
        self.isUppercase = id.allSatisfy { $0.isUppercase }
        
    }

    func goTo(path: [CavePath], doubles: Int) {
        var newPath: [CavePath] = path.map{$0}
        newPath.append(self)
        
        if isStart,
           path.isEmpty {
            for neighbor in neighbors {
                neighbor.goTo(path: newPath, doubles: doubles)
            }
            return
        }
        if isStart {
            return
        }
        if isEnd {
            visitsCount += 1;
            return
        }
        for neighbor in neighbors {
        
            var names: [String] = []
            for item in newPath {
                if  !item.isUppercase {
                    names.append(item.id)
                }
            }
            
            let namesSorted = names.sorted()
            
            var doublesCount = 0
            for index in 0..<namesSorted.count - 1 {
                if namesSorted[index] == namesSorted[index + 1] {
                    doublesCount += 1
                }
            }

            if doublesCount <= doubles {
                neighbor.goTo(path: newPath, doubles: doubles)
            }
        }
    }
}

func caclulate(countOfDoubles: Int) -> String {
    let paths = getPaths()
    
    let start = paths.first { $0.isStart }
    let end = paths.first { $0.isEnd }
    
    if let start = start,
       let end = end {
        
        start.goTo(path: [], doubles: countOfDoubles)
        
        return String(end.visitsCount)
    }
    return ""
}

func getPaths() -> [CavePath] {
    let connections: [(String, String)] = input.split(separator: "\n").map {
            let components = String($0).components(separatedBy: "-")
            return (components[0], components[1])
        }
    
    let pathList = Set(connections.flatMap { [$0.0, $0.1] }).map(CavePath.init)
   
    let pathDict = Dictionary(uniqueKeysWithValues: pathList.map { ($0.id, $0) })
    
    for connection in connections {
        if let zero = pathDict[connection.0],
           let one = pathDict[connection.1] {
            zero.neighbors.append(one)
            one.neighbors.append(zero)
        }
    }
    return pathList
}


func partOne() {
    print("\(caclulate(countOfDoubles: 0))")
}

func partTwo() {
    print("\(caclulate(countOfDoubles: 1))")
}

partOne()
partTwo()


//: [Next](@next)
