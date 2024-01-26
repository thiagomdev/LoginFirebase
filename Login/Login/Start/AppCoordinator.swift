import UIKit

protocol AppCoordinating {
    func start()
}

final class AppCoordinator {
    
    private var navigation: UINavigationController
    private var rootViewController: UIViewController?
    private let sessionManager: SessionManager
    private let rootCoordinator: RootCoordinating
    private let noSessionCoordinator: NoSessionCoordinating
    private var window: UIWindow
    
    init(
        window: UIWindow,
        navigation: UINavigationController,
        sessionManager: SessionManager = .shared
    ) {
        self.sessionManager = sessionManager
        self.window = window
        self.navigation = navigation
        self.rootCoordinator = RootCoordinator(window: window)
        self.noSessionCoordinator = NoSessionCoordinator(
            window: window,
            navigationController: navigation,
            rootCoordinator: rootCoordinator
        )
    }
}

extension AppCoordinator: AppCoordinating {
    func start() {
        if !sessionManager.hasSession {
            login()
        } else {
            home()
        }
    }
    
    private func login() {
        noSessionCoordinator.login()
    }
    
    private func home() {
//        let home = HomeFactory.make()
//        rootCoordinator.display(viewController: home)
    }
}
