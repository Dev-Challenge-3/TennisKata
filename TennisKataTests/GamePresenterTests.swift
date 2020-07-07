import XCTest
@testable import TennisKata

class GamePresenterTests: XCTestCase {

    let mockView = GameViewMock()
    var presenter: GamePresenter!
    
    override func setUp() {
        super.setUp()
        presenter = GamePresenter(view: mockView)
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
    }
    
    private func playerScore(player: SelectedPlayer, times: Int){
        for _ in 1...times {
            presenter.game.playerPlays(selectedPlayer: player)
        }
    }
    
    //MARK: - Player One Score

    func testGamePresenter_PlayerOneScore_ShouldReturnPlayerOneScore() {
        //Arrange
        let expectedScore = "40"
        playerScore(player: .playerOne, times: 3)
        //Act
        presenter.playerOneScore()
        //Assert
        XCTAssertEqual(expectedScore, mockView.playerOneScore, " Player One score matches")
    }
    
    //MARK: - Player Two Score
    
    func testGamePresenter_PlayerTwoScore_ShouldReturnPlayerTwoScore() {
        //Arrange
        let expectedScore = "30"
        playerScore(player: .playerTwo, times: 2)
        //Act
        presenter.playerTwoScore()
        //Assert
        XCTAssertEqual(expectedScore, mockView.playerTwoScore, "Player Two score matches")
    }

    //MARK: - Game Score
    
    func testGamePresenter_DisplayScore_ShouldReturnScore() {
        //Arrange
        let expectedScore = TennisKataConstants.deuce
        playerScore(player: .playerOne, times: 3)
        playerScore(player: .playerTwo, times: 3)
        //Act
        presenter.displayScore()
        //Assert
        XCTAssertEqual(expectedScore, mockView.gameScore, "Game score matches")

    }


}
