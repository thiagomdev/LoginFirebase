import UIKit

protocol AppCoordinating {
    func start()
    func login()
    func signUp()
    func resetPassword()
}

final class AppCoordinator {
    
    private var navigation: UINavigationController
    private var rootViewController: UIViewController?
    private let sessionManager: SessionManager
    private let loginCoordinator: LoginCoordinating
    private let signUpCoordinator: SignUpCoordinating
    private let resetPasswordCoordinator: ResetPasswordCoordinating
    
    private var window: UIWindow
    
    init(
        window: UIWindow,
        navigation: UINavigationController,
        sessionManager: SessionManager = .shared,
        loginCoordinator: LoginCoordinating,
        signUpCoordinator: SignUpCoordinating,
        resetPasswordCoordinator: ResetPasswordCoordinating
    ) {
        self.sessionManager = sessionManager
        self.window = window
        self.navigation = navigation
        self.loginCoordinator = loginCoordinator
        self.signUpCoordinator = signUpCoordinator
        self.resetPasswordCoordinator = resetPasswordCoordinator
    }
}

extension AppCoordinator: AppCoordinating {
    func start() {
        if !sessionManager.hasSession {
            login()
        } else {
            signUp()
        }
    }
    
    func login() {
        loginCoordinator.start()
    }
    
    func signUp() {
        signUpCoordinator.start()
    }
    
    func resetPassword() {
        resetPasswordCoordinator.start()
    }
}
