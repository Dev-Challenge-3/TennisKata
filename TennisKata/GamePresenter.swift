class GamePresenter {
    
    private weak var view: GameView?
    let playerOne: Player
    let playerTwo: Player
    let game: Game

    init(view: GameView?) {
        self.view = view
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }

    //MARK: - Player One Score
    
    func playerOneScore() {
        view?.playerOneScore(playerOneScore: game.playerScore(selectedPlayer: .playerOne))
    }

}
