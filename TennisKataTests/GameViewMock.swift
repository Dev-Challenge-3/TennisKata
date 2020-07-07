@testable import TennisKata

class GameViewMock: GameView {
    
    var playerOneScore: String?
    var playerTwoScore: String?
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore = playerOneScore
    }
    
    func playerTwoScore(playerTwoScore: String) {
        self.playerTwoScore = playerTwoScore
    }
}
