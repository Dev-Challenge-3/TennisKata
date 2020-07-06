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
    
    //MARK: - Test case for the score 40 - 0

    func testGame_GameScoreAfterPlayerOneScoresForty_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 3)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == TennisKataConstants.fortyLove, "Should return game score as \(TennisKataConstants.fortyLove)")
    }
    
    //MARK: - Test case for the score 0 - 15

    func testGame_GameScoreAfterPlayerTwoScoresFifteen_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerTwo, times: 1)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == TennisKataConstants.loveFifteen, "Should return game score as \(TennisKataConstants.loveFifteen)")
    }
    
    //MARK: - Test case for the score 0 - 30

    func testGame_GameScoreAfterPlayerTwoScoresThirty_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerTwo, times: 2)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == TennisKataConstants.loveThirty, "Should return game score as \(TennisKataConstants.loveThirty)")
    }
    
    //MARK: - Test case for the score 0 - 40

    func testGame_GameScoreAfterPlayerTwoScoresForty_ShouldReturnScore(){
        //Arrange
        playerServeWins(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.loveForty, "Should return game score as \(TennisKataConstants.loveForty)")
    }
    
    //MARK: - Test case for the score 15 - 15

    func testGame_PlayerOneScoresFifteenAndPlayerTwoScoresFifteen_ShoudReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 1)
        playerServeWins(player: .playerTwo, times: 1)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.fifteenAll, "Should return game score as \(TennisKataConstants.fifteenAll)")
    }
    
    //MARK: - Test case for the score 30 - 30

    func testGame_PlayerOneScoresThirtyAndPlayerTwoScoresThirty_ShoudReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 2)
        playerServeWins(player: .playerTwo, times: 2)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.thirtyAll, "Should return game score as \(TennisKataConstants.thirtyAll)")
    }
    
    //MARK: - Test case for Deuce

     func testGame_GameScoreAfterDeuce_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 3)
        playerServeWins(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.deuce, "Should game score as \(TennisKataConstants.deuce)")
    }
}
