import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    //MARK: - Test case to initialise players and score
    
    func testPlayer_InitialScore_ShouldReturnZero() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        let initialScore = player.score
        //Assert
        XCTAssertTrue(initialScore == 0, "Players Initial score should be zero")
    }
}
