enum SelectedPlayer {
    case playerOne, playerTwo
}

enum ScoreTranslation: Int, CustomStringConvertible {
    
    case love = 0, fifteen = 15, thirty = 30, forty = 40
    
    var description: String {
        get {
            switch self {
            case .love:
                return "love"
            case .fifteen:
                return "fifteen"
            case .thirty:
                return "thirty"
            case .forty:
                return "forty"
            }
        }
    }
}

final class Game {
    
    private let playerOne: Player
    private let playerTwo: Player
    
    init(firstPlayer: Player, secondPlayer: Player) {
        playerOne = firstPlayer
        playerTwo = secondPlayer
    }
    
    //MARK: - Player Action
    
    func playerPlays(selectedPlayer: SelectedPlayer) {
        
        switch selectedPlayer {
        case .playerOne:
            playerOne.play()
        case .playerTwo:
            playerTwo.play()
        }
    }
    
    //MARK: - Display Game score

    func score() -> String {
        
        let playerOneScore = "\(playerOne.name) \(scoreTranslation(score: playerOne.score)) - "
        let playerTwoScore = "\(playerTwo.name) \(scoreTranslation(score: playerTwo.score))"

        if isDeuce() {
            return "Deuce"
        }else if hasAdvantage() {
            return playerWithHighestScore() + " Advantage"
        }else if hasWinner() {
            return playerWithHighestScore() + " wins"
        }
        
        return playerOneScore + playerTwoScore
    }
    
    //MARK: - Display Player scores
    
    func playerScore(selectedPlayer: SelectedPlayer) -> String {
        switch selectedPlayer {
        case .playerOne:
            return playerScoreTranslation(score: playerOne.score)
        case .playerTwo:
            return playerScoreTranslation(score: playerTwo.score)
        }

    }
    
    //MARK: - Private Methods
    
    private func playerScoreTranslation(score: Int) -> String {
                
        if hasWinner() {
            return "1"
        }
                
        switch score {
        case 0:
            return String(ScoreTranslation.love.rawValue)
        case 1:
            return String(ScoreTranslation.fifteen.rawValue)
        case 2:
            return String(ScoreTranslation.thirty.rawValue)
        default:
            return String(ScoreTranslation.forty.rawValue)
        }
     
    }
    
    private func isDeuce() -> Bool {
        return playerOne.score >= 3 && playerTwo.score == playerOne.score
    }
    
    private func hasAdvantage() -> Bool {
        
        if (playerOne.score >= 4 || playerTwo.score >= 4) && (abs(playerOne.score - playerTwo.score) == 1) {
            return true
        }
        
        return false
    }

    private func playerWithHighestScore() -> String {
        
        return playerOne.score > playerTwo.score ? playerOne.name : playerTwo.name
    }

    private func hasWinner() -> Bool {
        
        if (playerOne.score >= 4 || playerTwo.score >= 4) && (abs(playerOne.score - playerTwo.score) >= 2) {
            return true
        }
        
        return false
    }
    
    private func scoreTranslation(score: Int) -> String {
        
        switch score {
        case 0:
            return String(ScoreTranslation.love.description)
        case 1:
            return ScoreTranslation.fifteen.description
        case 2:
            return ScoreTranslation.thirty.description
        default:
            return ScoreTranslation.forty.description
        }
    }
}
