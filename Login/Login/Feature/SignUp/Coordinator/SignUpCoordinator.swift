import UIKit

protocol SignUpCoordinating: AnyObject {
    func start()
    func login()
}

final class SignUpCoordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    private weak var loginCoordinator: LoginCoordinating?
    
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
        let viewModel = SignUpViewModel()
        let signUp = SignUpViewController(viewModel: viewModel)
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
}
