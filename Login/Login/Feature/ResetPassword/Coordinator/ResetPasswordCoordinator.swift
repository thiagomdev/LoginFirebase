import UIKit

protocol ResetPasswordCoordinating {
    func start()
}

final class ResetPasswordCoordinator {
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

extension ResetPasswordCoordinator: ResetPasswordCoordinating {
    func start() {
        let reset = ResetPasswordViewController()
        reset.coordinator = self

        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                self?.window.rootViewController = reset
                self?.window.makeKeyAndVisible()
                self?.window.layoutSubviews()
        })
    }
}
