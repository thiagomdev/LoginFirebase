import UIKit

protocol ResetPasswordCoordinating: AnyObject {
    func start()
    func login()
}

final class ResetPasswordCoordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    private var loginCoordinator: LoginCoordinating
    
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

extension ResetPasswordCoordinator: ResetPasswordCoordinating {
    func start() {
        let reset = ResetPasswordViewController()
        reset.coordinator = self

        UIView.transition(
            with: window,
            duration: 0.8,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                window.rootViewController = reset
                window.makeKeyAndVisible()
                window.layoutSubviews()
        })
    }
    
    func login() {
        loginCoordinator = LoginCoordinator(
            window: window,
            navigationController: navigationController,
            resetPasswordCoordinator: self
        )
        loginCoordinator.start()
    }
}
