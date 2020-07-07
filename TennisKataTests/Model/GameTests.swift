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
        XCTAssertTrue(gameScore == TennisKataConstants.deuce, "Should return game score as \(TennisKataConstants.deuce)")
    }
    
    //MARK: - Test case for Player 1 Advantage
    
    func testGame_GameScorePlayerOneAdvantage_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 4)
        playerServeWins(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.playOneAdvantage, "Should return game score as \(TennisKataConstants.playOneAdvantage)")
    }
    
    //MARK: - Test case for Player 2 Advantage
    
    func testGame_GameScorePlayerTwoAdvantage_ShouldReturnScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 3)
        playerServeWins(player: .playerTwo, times: 4)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.playerTwoAdvantage, "Should return game score as \(TennisKataConstants.playerTwoAdvantage)")
    }
    
    //MARK: - Test case for Player 1 Wins
    
    func testGame_PlayerOneWins_ShoudReturnScore() {
        //Arrange
         playerServeWins(player: .playerOne, times: 4)
         playerServeWins(player: .playerTwo, times: 2)
         //Act
         let gameScore = game.score()
         //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.playOneWins, "Should return \(TennisKataConstants.playOneWins)")
    }
    
    func testGame_PlayerOneScoreWhenPlayerOneWins_ShouldUpdateGameScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 4)
        playerServeWins(player: .playerTwo, times: 2)
        //Act
        let playerOneScore = game.playerScore(selectedPlayer: .playerOne)
        //Assert
        XCTAssertTrue(playerOneScore == "1", "Should update Player 1 score")

    }
    
    //MARK: - Test case for Player 2 Wins
    
    func testGame_PlayerTwoWins_ShoudReturnScore() {
        //Arrange
         playerServeWins(player: .playerOne, times: 2)
         playerServeWins(player: .playerTwo, times: 4)
         //Act
         let gameScore = game.score()
         //Assert
        XCTAssertTrue(gameScore == TennisKataConstants.playerTwoWins, "Should return \(TennisKataConstants.playerTwoWins)")
    }
    
    //MARK: - Test case to display player one score

    func testGame_PlayerScoresFifteenAll_ShouldReturnPlayerOneScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 1)
        playerServeWins(player: .playerTwo, times: 1)
        //Act
        let playerScore = game.playerScore(selectedPlayer: .playerOne)
        //Assert
        XCTAssertTrue(playerScore == "15","Player 1 expected to score 15")
    }

    //MARK: - Test case to display player two score

    func testGame_PlayerScoresThirtyAll_ShouldReturnPlayerTwoScore() {
        //Arrange
        playerServeWins(player: .playerOne, times: 2)
        playerServeWins(player: .playerTwo, times: 2)
        //Act
        let playerScore = game.playerScore(selectedPlayer: .playerTwo)
        //Assert
        XCTAssertTrue(playerScore == "30","Player 2 expected to score 30")
    }
    
}
