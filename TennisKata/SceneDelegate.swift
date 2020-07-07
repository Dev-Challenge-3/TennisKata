import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let initialViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController")as? GameViewController else { return }
        initialViewController.presenter = GamePresenter(view: initialViewController)
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()

    }
}

