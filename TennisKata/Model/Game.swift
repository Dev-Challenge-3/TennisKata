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
        }
        
        return playerOneScore + playerTwoScore
    }
    
    //MARK: - Private Methods
    
    private func isDeuce() -> Bool {
        return playerOne.score >= 3 && playerTwo.score == playerOne.score
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
