@testable import TennisKata

class GameViewMock: GameView {
    
    var playerOneScore: String?
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore = playerOneScore
    }
    
}
