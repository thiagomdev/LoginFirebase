import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return run()
    }
}

extension AppDelegate {
    private func run() -> Bool {
        let window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        self.window = window
        
        let loginCoordinatorVirtualProxy = LoginCoordinatorVirtualProxy()
        let navigation = UINavigationController()

        let reset = ResetPasswordCoordinator(
            window: window,
            navigationController: navigation,
            loginCoordinator: loginCoordinatorVirtualProxy
        )
        
        let signUp = SignUpCoordinator(
            window: window,
            navigationController: navigation,
            loginCoordinator: loginCoordinatorVirtualProxy
        )
        
        let login = LoginCoordinator(
            window: window,
            navigationController: navigation,
            resetPasswordCoordinator: reset
        )

        appCoordinator = AppCoordinator(
            window: window,
            navigation: navigation,
            loginCoordinator: login,
            signUpCoordinator: signUp,
            resetPasswordCoordinator: reset
        )
        
        appCoordinator?.start()
        return true
    }
}
