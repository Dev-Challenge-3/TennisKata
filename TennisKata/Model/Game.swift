enum SelectedPlayer {
    case playerOne, playerTwo
}

enum ScoreTranslation: String {
    
    case love, fifteen, thirty, forty

    var description: String {
        get {
            switch self {
            case .love:
                return "0"
            case .fifteen:
                return "15"
            case .thirty:
                return "30"
            case .forty:
                return "40"
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
            return playerScoreTranslation(score: playerOne.score, opponentScore: playerTwo.score)
        case .playerTwo:
            return playerScoreTranslation(score: playerTwo.score, opponentScore: playerOne.score)
        }

    }
    
    //MARK: - Private Methods
    
    private func playerScoreTranslation(score: Int, opponentScore: Int) -> String {
                
        if hasWinner() {
            return score >= opponentScore + 2 ? "1" : "0"
        }
        
        if hasAdvantage() {
            return "AD"
        }
        
        return playerScore(score: score)
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

    private func playerScore(score: Int) -> String {
        switch score {
        case 0:
            return ScoreTranslation.love.description
        case 1:
            return ScoreTranslation.fifteen.description
        case 2:
            return ScoreTranslation.thirty.description
        default:
            return ScoreTranslation.forty.description
        }
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
            return ScoreTranslation.love.rawValue
        case 1:
            return ScoreTranslation.fifteen.rawValue
        case 2:
            return ScoreTranslation.thirty.rawValue
        default:
            return ScoreTranslation.forty.rawValue
        }
    }
}
