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
        
        return playerOneScore + playerTwoScore
    }
    
    //MARK: - Private Methods
    
    private func scoreTranslation(score: Int) -> String {
        
        switch score {
        case 0:
            return "love"
        default:
            return "fifteen"
        }
    }
}
