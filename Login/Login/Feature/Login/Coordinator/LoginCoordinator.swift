import UIKit

protocol LoginCoordinating: AnyObject {
    func start()
    func signUp()
}

final class LoginCoordinator {
    
    private let window: UIWindow
    private let signUpCoordinator: SignUpCoordinating
    private var navigationController: UINavigationController
    private var rootViewController: UIViewController?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        signUpCoordinator: SignUpCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.signUpCoordinator = signUpCoordinator
    }
}

extension LoginCoordinator: LoginCoordinating {
    func start() {
        let login = LoginViewController()
//        let navigation = UINavigationController(rootViewController: login)
        
        login.coordinator = self
        window.rootViewController = login
        window.makeKeyAndVisible()
    }
    
    func signUp() {
        signUpCoordinator.start()
    }
}
