enum SelectedPlayer {
    case playerOne, playerTwo
}

private enum ScoreTranslation: Int {
    
    case love, fifteen, thirty, forty

    static let numberMapper: [ScoreTranslation: String] = [
        .love: "0", .fifteen: "15", .thirty: "30", .forty: "40"
    ]
    
    static let wordMapper: [ScoreTranslation: String] = [
        .love: "love", .fifteen: "fifteen", .thirty: "thirty", .forty: "forty"
    ]
    
    var scoreNumber: String {
        return ScoreTranslation.numberMapper[self]!
    }
    
    var scoreWord: String {
        return ScoreTranslation.wordMapper[self]!
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
        
        var playerOneScore = ""
        var playerTwoScore = ""
        
        if isDeuce() {
            return "Deuce"
        }else if hasAdvantage() {
            return playerWithHighestScore() + " Advantage"
        }else if hasWinner() {
            return playerWithHighestScore() + " wins"
        }
        
        if let scorePlayerOne = ScoreTranslation(rawValue: playerOne.score) {
            playerOneScore = "\(playerOne.name) \(scorePlayerOne.scoreWord) - "
        }
        if let scorePlayerTwo = ScoreTranslation(rawValue: playerTwo.score) {
            playerTwoScore = "\(playerTwo.name) \(scorePlayerTwo.scoreWord)"
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
        
        var scoreValue = ""
        
        if hasWinner() {
            return score >= opponentScore + 2 ? "1" : "0"
        }else if hasAdvantage() {
            return score == opponentScore + 1 ? "AD" : "40"
        }else if isDeuce() {
            return "40"
        }
        
        if let playerScore = ScoreTranslation(rawValue: score) {
            scoreValue =  playerScore.scoreNumber
        }

        return scoreValue
        
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
}
