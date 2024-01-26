import UIKit

protocol NoSessionCoordinating {
    func login()
    func signup()
    func resetPassword()
}

final class NoSessionCoordinator: NoSessionCoordinating {
    private let window: UIWindow
    private let rootCoordinator: RootCoordinating
    private var navigationController: UINavigationController
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        rootCoordinator: RootCoordinating
    ) {
        self.window = window
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func login() {
        let login = LoginFactory.make(
            noSessionCoordinator: self
        )
        
        rootCoordinator.display(viewController: login)
    }
    
    func signup() {
        let signUp = SignUpFactory.make(
            noSessionCoordinator: self
        )

        rootCoordinator.display(viewController: signUp)
    }
    
    func resetPassword() {
        let resetPassword = ResetPasswordFactory.make(
            noSessionCoordinator: self
        )
        
        rootCoordinator.display(viewController: resetPassword)
    }
}
