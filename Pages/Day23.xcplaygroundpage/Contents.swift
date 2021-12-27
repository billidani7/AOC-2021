//: [Previous](@previous)

import Foundation

let Amphipods: [Character] = ["A", "B", "C", "D"]
let roomCols: [Character:Int] = ["A" : 2, "B" : 4, "C" : 6, "D" : 8]
let colsRoom: [Int:Character] = [2 : "a", 4 : "b", 6 : "c", 8 : "d"]
let costs: [Character:Int] = ["A" : 1, "B" : 10, "C" : 100, "D" : 1000]
var minenergy = 100000

var board: [[Character]]
board = [[" "," "," "," "," "," "," "," "," "," "," "],
         ["#","#","B","#","C","#","C","#","B","#","#"],
         //["#","#","D","#","C","#","B","#","A","#","#"],
         //["#","#","D","#","B","#","A","#","C","#","#"],
         ["#","#","D","#","D","#","A","#","A","#","#"]]


func play() {
    
    minenergy = 100000
    minenergy = sortAmphipods(board: board, cost: 0)
    print ("\(minenergy)")
}

func sortAmphipods(board: [[Character]], cost: Int) -> Int {
    var mincost = Int.max
    
    if isBoardSolved(board: board) {
        if cost < minenergy {
            print ("new mincost: \(cost)")
            minenergy = cost
        }
        return cost
    }
    
    let moves = findValidMoves(board: board)
    // do the moves
    for move in moves {
        let newcost = cost + move.cost * costs[move.amphipod]!
        if (newcost >= minenergy) {
            continue
        }
        var newboard = board
        newboard[move.start[0]][move.start[1]] = " "
        let ch = move.dest[0] == 0 ? move.amphipod : move.amphipod.lowercased().first!
        newboard[move.dest[0]][move.dest[1]] = ch
        
        let score = sortAmphipods(board:newboard, cost: newcost)
        mincost = min(score, mincost)
    }
    return mincost
}


struct Move {
    let amphipod: Character
    let start: [Int]
    let dest: [Int]
    let cost: Int
    init(amphipod : Character, start: [Int], dest: [Int], cost: Int) {
        self.amphipod = amphipod
        self.start = start
        self.dest = dest
        self.cost = cost
    }
}


func findValidMoves(board: [[Character]]) -> [Move] {
    var movelist: [Move] = []

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            let a = board[i][j]
            if Amphipods.contains(a) {
                let moves = findAmphipodMoves(board: board, amphipod: a, startpos: [i,j] )
                for move in moves {
                    movelist.append(move)
                }
            }
        }
    }
    return movelist
}

func findAmphipodMoves(board: [[Character]], amphipod: Character, startpos: [Int]) -> [Move] {
    var movelist: [Move] = []
    
    if startpos[0] >= 2 && board[startpos[0]-1][startpos[1]] != " " {
        return movelist
    }
    
    let move = isPathToRoom(board: board, amphipod: amphipod, startpos: startpos)
    if move != nil {
        movelist.append(move!)
        return movelist
    }
    
    if startpos[0] != 0 {
        var cost = startpos[0]
        for x in startpos[1]+1...10 {
            cost += 1
            if board[0][x] != " " { // blocked
                break
            }
            if !roomCols.values.contains(x) {
                movelist.append(Move(amphipod: amphipod, start: startpos, dest: [0,x], cost: cost))
            }
        }
        
        cost = startpos[0]
        for x in stride(from: startpos[1]-1, through: 0, by: -1) {
            cost += 1
            if board[0][x] != " " { // blocked
                break
            }
            if !roomCols.values.contains(x) {
                movelist.append(Move(amphipod: amphipod, start: startpos, dest: [0,x], cost: cost))
            }
        }
    }
    
    return movelist
}

func isPathToRoom(board: [[Character]], amphipod: Character, startpos: [Int]) -> Move? {
    let roomOpen = isRoomOpen(board: board, amphipod: amphipod)
    if roomOpen == 0 {
        return nil
    }
    var cost = startpos[0]
    if roomCols[amphipod]! > startpos[1] {
        for x in startpos[1]+1...roomCols[amphipod]! {
            cost += 1
            if board[0][x] != " " {
                return nil
            }
        }
    } else {
        for x in stride(from: startpos[1]-1, through: roomCols[amphipod]!, by: -1) {
            cost += 1
            if board[0][x] != " " {
                return nil
            }
        }
    }
    cost = cost + roomOpen
    return Move(amphipod: amphipod, start: startpos, dest: [roomOpen,roomCols[amphipod]!], cost: cost)
}

func isRoomOpen(board: [[Character]], amphipod: Character) -> Int {
    let lcase = amphipod.lowercased().first!
    
    let col = roomCols[amphipod]!
    
    if board[1][col] == " " && board[2][col] == lcase { return 1 }
    if board[2][col] == " " && board[3][col] == lcase { return 2 }
    if board[3][col] == " " && board[4][col] == lcase { return 3 }
    if board[4][col] == " " { return 4 }
    return 0
}

func isBoardSolved(board: [[Character]]) -> Bool {
    if board[0].filter({$0 != " "}).count > 0 { return false }
    for i in 1...2 {
        for j in stride(from: 2, through: 8, by: 2) {
            if board[i][j] != colsRoom[j] { return false }
        }
    }
    return true
}

play()

//: [Next](@next)
