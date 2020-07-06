import XCTest
@testable import TennisKata

class GameTests: XCTestCase {

    var playerOne = Player(playerName: "Player 1")
    var playerTwo = Player(playerName: "Player 2")
    var game: Game!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    //MARK: - Test case for the score 15 - 0

    func testGame_GameScoreAfterPlayerOneScoresFifteen_ShouldReturnTrue() {
        //Arrange
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerPlays(selectedPlayer: .playerOne)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 1 fifteen - Player 2 love", "Should return game score as Player 1 fifteen - Player 2 love")
    }
}