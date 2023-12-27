import UIKit

protocol SignUpCoordinating: AnyObject {
    func start()
    func login()
    func resetPassword()
}

final class SignUpCoordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    private var loginCoordinator: LoginCoordinating?
    private var resetCoordinator: ResetPasswordCoordinating?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        loginCoordinator: LoginCoordinating
//        resetCoordinator: ResetPasswordCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.loginCoordinator = loginCoordinator
//        self.resetCoordinator = resetCoordinator
    }
}

extension SignUpCoordinator: SignUpCoordinating {
    func start() {
        let signUp = SignUpViewController()
        signUp.coordinator = self

        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                window.rootViewController = signUp
                window.makeKeyAndVisible()
                window.layoutSubviews()
        })
    }
    
    func login() {
        loginCoordinator?.start()
    }
    
    func resetPassword() {
        resetCoordinator?.login()
    }
}
