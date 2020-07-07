import UIKit

class GameViewController: UIViewController {

    var presenter: GamePresenter!
    
    @IBOutlet weak var scoreMessage: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Player One Action
    
    @IBAction func playerOneAction(_ sender: UIButton) {
        presenter.game.playerPlays(selectedPlayer: .playerOne)
        updateScores()
    }
    
    //MARK: - Player Two Action
    
    @IBAction func playerTwoAction(_ sender: UIButton) {
        presenter.game.playerPlays(selectedPlayer: .playerTwo)
        updateScores()
    }
    
    //MARK: - Reset Scores
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        _ = presenter.resetScore()
    }
    
    //MARK: - Update Scores
    
    func updateScores() {
        _ = presenter.playerOneScore()
        _ = presenter.playerTwoScore()
        _ = presenter.displayScore()
    }

    
}

extension GameViewController: GameView {
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore.text = playerOneScore
    }
    
    func playerTwoScore(playerTwoScore: String) {
        self.playerTwoScore.text = playerTwoScore
    }
    
    func display(scoreMessage: String) {
        self.scoreMessage.text = scoreMessage
    }
    
    
}
