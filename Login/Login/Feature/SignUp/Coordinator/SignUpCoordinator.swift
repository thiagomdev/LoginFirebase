import UIKit

protocol SignUpCoordinating: AnyObject {
    func start()
    func login()
}

final class SignUpCoordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    weak var loginCoordinator: LoginCoordinating?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        loginCoordinator: LoginCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.loginCoordinator = loginCoordinator
    }
}

extension SignUpCoordinator: SignUpCoordinating {
    func start() {
        let signUp = SignUpViewController()
        signUp.coordinator = self

        window.rootViewController = signUp
        window.makeKeyAndVisible()
    }
    
    func login() {
        loginCoordinator?.start()
    }
}
