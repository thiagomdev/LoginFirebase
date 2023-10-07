import UIKit

protocol AppCoordinating {
    func start()
    func login()
    func signUp()
}

final class AppCoordinator {
    
    private var navigation: UINavigationController
    private var rootViewController: UIViewController?
    private let sessionManager: SessionManager
    private let loginCoordinator: LoginCoordinating
    private let signUpCoordinator: SignUpCoordinating
    private var window: UIWindow
    
    init(
        window: UIWindow,
        navigation: UINavigationController,
        sessionManager: SessionManager = .shared,
        loginCoordinator: LoginCoordinating,
        signUpCoordinator: SignUpCoordinating
    ) {
        self.sessionManager = sessionManager
        self.window = window
        self.navigation = navigation
        self.loginCoordinator = loginCoordinator
        self.signUpCoordinator = signUpCoordinator
    }
}

extension AppCoordinator: AppCoordinating {
    func start() {
        if sessionManager.hasSession {
            signUp()
        } else {
            login()
        }
    }
    
    func login() {
        loginCoordinator.start()
    }
    
    func signUp() {
        signUpCoordinator.start()
    }
}
