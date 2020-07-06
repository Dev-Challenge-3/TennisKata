import XCTest
@testable import TennisKata

class GameTests: XCTestCase {

    var playerOne: Player!
    var playerTwo: Player!
    var game: Game!

    override func setUpWithError() throws {
        super.setUp()
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }

    override func tearDownWithError() throws {
        super.tearDown()
        playerOne = nil
        playerTwo = nil
        game = nil
    }
    
    private func playerServeWins(player: SelectedPlayer, times: Int){
        for _ in 1...times {
            game.playerPlays(selectedPlayer: player)
        }
    }
    
    //MARK: - Test case for the score 15 - 0

    func testGame_GameScoreAfterPlayerOneScoresFifteen_ShouldReturnTrue() {
        //Arrange
        playerServeWins(player: .playerOne, times: 1)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.fifteenLove, "Should return game score as \(TennisKataConstants.fifteenLove)")
    }
    
    //MARK: - Test case for the score 30 - 0
    
    func testGame_GameScoreAfterPlayerOneScoresThirty_ShouldReturnTrue() {
        //Arrange
        playerServeWins(player: .playerOne, times: 2)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == TennisKataConstants.thirtyLove, "Should return game score as \(TennisKataConstants.thirtyLove)")
    }
    
    //MARK: - Test cases for the score 40 - 0

    func testGame_GameScoreAfterPlayerOneScoresForty_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 3)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == TennisKataConstants.fortyLove, "Should return game score as \(TennisKataConstants.fortyLove)")
    }
}
