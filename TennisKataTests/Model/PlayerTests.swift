import XCTest
@testable import TennisKata

class PlayerTests: XCTestCase {

    //MARK: - Test case to initialise players and score
    
    func testPlayer_InitialScore_ShouldReturnZero() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        let initialScore = player.score
        //Assert
        XCTAssertTrue(initialScore == 0, "Players Initial score should be zero")
    }
    
    //MARK: - Test case for score update
    
    func testPlayer_PlayerStartsGame_ShouldUpdateScore() {
        //Arrange
        let player = Player(playerName: "Player 2")
        //Act
        player.play()
        //Assert
        XCTAssertTrue(player.score == 1, "Players score should update")
    }
    
    //MARK: - Test case to reset players score
    
    func testPlayer_ClearPlayersScore_ShouldResetScore() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        player.clearScore()
        //Assert
        XCTAssertTrue(player.score == 0, "Players score should reset")
    }
}
