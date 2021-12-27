//: [Previous](@previous)

import Foundation

let input = """
Player 1 starting position: 4
Player 2 starting position: 8
"""

let startingPositions = input.components(separatedBy: "\n").map{Int(String($0.last!))!}

let endGameAtScore = 1000

func partOne()  {
    
    var die = 1
    var rolls = 0
    
    func nextScore() -> Int {
        
        let result =  (die + 1) * 3
        
        die += 3
        die %= 10
        
        rolls += 3
        
        return result
    }
    
    var player1 = Player(position: startingPositions[0])
    var player2 = Player(position: startingPositions[1])
    
    var player1Turn = true
    
    while player1.score < endGameAtScore, player2.score < endGameAtScore {
        let score = nextScore()
        
        if player1Turn {
            player1.move(steps: score)
        } else {
            player2.move(steps: score)
        }
        
        player1Turn.toggle()
    }
    
    if player1.score < player2.score {
        print("\(player1.score * rolls)")
    }

    print("\(player2.score * rolls)")
}

func partTwo() {
    
    var computedGames: [Game: Bool] = [:]
    
    var player1WinsCounter = 0
    var player2WinsCounter = 0
    
    var games = [
        Game(player1:
                Player(position: startingPositions[0]),
             player2: Player(position: startingPositions[1])
        ): 1
    ]
    
    while let (game, universes) = games.min(by: { $0.key.getTotlaScore() < $1.key.getTotlaScore() }) {
        
        games.removeValue(forKey: game)
        
        if let current = computedGames[game] {
            
            if current {
                player1WinsCounter += universes
            }
            else {
                player2WinsCounter += universes
                
            }
            
            continue
        }
        
        for (newGame, count) in game.nextGame() {
            let newGameInstances = universes * count
            
            if let current = computedGames[newGame] {
                if current {
                    player1WinsCounter += newGameInstances
                    
                }
                else {
                    player2WinsCounter += newGameInstances
                    
                }
                continue
            }
            
            if let isPlayer1Wins = newGame.isPlayer1Wins() {
                computedGames[newGame] = isPlayer1Wins
                if isPlayer1Wins {
                    player1WinsCounter += newGameInstances
                }
                else {
                    player2WinsCounter += newGameInstances
                    
                }
                continue
            }
            
            games[newGame, default: 0] += newGameInstances
        }
    }
    
    if player1WinsCounter > player2WinsCounter {
        print("\(player1WinsCounter)")
    }
    
    print("\(player2WinsCounter)")

}

struct Player: Hashable {
    var score = 0
    var position: Int
    
    mutating func move(steps: Int) {
        position += steps
        if position > 10 {
            if position % 10 == 0 {
                position = 10
            } else {
                position = position % 10
            }
        }
        score += position
    }
}

struct Game: Hashable {
    
    let endGameAtScore = 21
    
    var player1: Player
    var player2: Player
    
    var player1Turn = true
        
    func isPlayer1Wins() -> Bool? {
        
        if player1.score >= endGameAtScore {
            return true
            
        }
        if player2.score >= endGameAtScore {
            return false
            
        }
        
        return nil
    }
    
    func getTotlaScore() -> Int {
        return player1.score + player2.score
    }
    
    func nextGame() -> [Game: Int] {
        
        var games: [Game: Int] = [:]
        
        for i in 1...3 {
            for j in 1...3 {
                for k in 1...3 {
                    let score = i + j + k
                    
                    var game = self
                    
                    if game.player1Turn {
                        game.player1.move(steps: score)
                    } else {
                        game.player2.move(steps: score)
                    }
                    
                    game.player1Turn.toggle()
                    
                    games[game, default: 0] += 1
                }
            }
        }
        
        return games
    }

}

partOne()
partTwo()


//: [Next](@next)
