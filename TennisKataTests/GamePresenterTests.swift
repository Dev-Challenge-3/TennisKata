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

}
