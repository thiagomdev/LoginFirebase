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

        window.rootViewController = reset
        window.makeKeyAndVisible()
    }
}
