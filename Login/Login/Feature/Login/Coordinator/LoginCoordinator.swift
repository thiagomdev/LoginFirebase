import UIKit

protocol LoginCoordinating: AnyObject {
    func start()
    func signUp()
    func resetPassword()
}

final class LoginCoordinator {
    
    private let window: UIWindow
    private let signUpCoordinator: SignUpCoordinating
    private let resetPasswordCoordinator: ResetPasswordCoordinating
    private var navigationController: UINavigationController
    private var rootViewController: UIViewController?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        signUpCoordinator: SignUpCoordinating,
        resetPasswordCoordinator: ResetPasswordCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.signUpCoordinator = signUpCoordinator
        self.resetPasswordCoordinator = resetPasswordCoordinator
    }
}

extension LoginCoordinator: LoginCoordinating {
    func start() {
        let login = LoginViewController()
        login.coordinator = self
        window.rootViewController = login
        window.makeKeyAndVisible()
    }
    
    func signUp() {
        signUpCoordinator.start()
    }
    
    func resetPassword() {
        resetPasswordCoordinator.start()
    }
}
