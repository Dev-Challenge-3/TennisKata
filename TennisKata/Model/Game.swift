enum SelectedPlayer {
    case playerOne, playerTwo
}

class Game {
    
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
        
        switch score {
        case 0:
            return String(score)
        default:
            return "15"
        }
    }
    
    private func isDeuce() -> Bool {
        return playerOne.score >= 3 && playerTwo.score == playerOne.score
    }
    
    private func hasAdvantage() -> Bool {
        if playerOne.score >= 4 && playerOne.score == playerTwo.score + 1 {
            return true
        }else if playerTwo.score >= 4 && playerTwo.score == playerOne.score + 1 {
            return true
        }
        return false
    }

    private func playerWithHighestScore() -> String {
        if (playerOne.score > playerTwo.score) {
            return playerOne.name;
        }
        return playerTwo.name;
    }
    
    private func hasWinner() -> Bool {
        if(playerOne.score >= 4 && playerOne.score >= playerTwo.score + 2 ) {
            return true
        }else if (playerTwo.score >= 4 && playerTwo.score  >= playerOne.score + 2) {
            return true
        }
        return false
    }
    
    private func scoreTranslation(score: Int) -> String {
        
        switch score {
        case 0:
            return "love"
        case 1:
            return "fifteen"
        case 2:
            return "thirty"
        default:
            return "forty"
        }
    }
}
