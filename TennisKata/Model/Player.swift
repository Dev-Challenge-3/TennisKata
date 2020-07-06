final class Player {

    private(set) var name: String
    private(set) var score: Int
    
    init(playerName: String) {
        name = playerName
        score = 0
    }
    
    //MARK: - Updates Player Score
    
    func play() {
        score += 1
    }
    
    //MARK: - Clears Player Score

    func clearScore() {
        score = 0
    }
}
