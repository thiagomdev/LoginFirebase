import UIKit

protocol LoginCoordinating: AnyObject {
    func start()
    func signUp()
    func resetPassword()
}

final class LoginCoordinator {
    
    private let window: UIWindow
    private var signUpCoordinator: SignUpCoordinating?
    private weak var resetPasswordCoordinator: ResetPasswordCoordinating?
    private var navigationController: UINavigationController
    private var rootViewController: UIViewController?
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        resetPasswordCoordinator: ResetPasswordCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.resetPasswordCoordinator = resetPasswordCoordinator
    }
}

extension LoginCoordinator: LoginCoordinating {
    func start() {
        let viewModel = LoginViewModel()
        let login = LoginViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: login)
        login.coordinator = self
        
        UIView.transition(
            with: window,
            duration: 0.8,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                window.rootViewController = navigation
                window.makeKeyAndVisible()
                window.layoutSubviews()
        })
    }
    
    func signUp() {
        signUpCoordinator = SignUpCoordinator(
            window: window,
            navigationController: navigationController,
            loginCoordinator: self
        )
        signUpCoordinator?.start()
    }
    
    func resetPassword() {
        resetPasswordCoordinator?.start()
    }
}
