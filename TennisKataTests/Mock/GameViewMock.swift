@testable import TennisKata

class GameViewMock: GameView {
    
    var playerOneScore: String?
    var playerTwoScore: String?
    var gameScore: String?
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore = playerOneScore
    }
    
    func playerTwoScore(playerTwoScore: String) {
        self.playerTwoScore = playerTwoScore
    }
    
    func display(scoreMessage: String) {
        gameScore = scoreMessage
    }
}
