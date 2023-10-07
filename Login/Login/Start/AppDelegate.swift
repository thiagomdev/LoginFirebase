import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let loginCoordinatorVirtualProxy = LoginCoordinatorVirtualProxy()
        let navigation = UINavigationController()

        let signUp = SignUpCoordinator(
            window: window,
            navigationController: navigation,
            loginCoordinator: loginCoordinatorVirtualProxy
        )
        
        let login = LoginCoordinator(
            window: window,
            navigationController: navigation,
            signUpCoordinator: signUp
        )

        appCoordinator = AppCoordinator(
            window: window,
            navigation: navigation,
            loginCoordinator: login,
            signUpCoordinator: signUp
        )
        
        appCoordinator?.start()
        return true
    }
}

final class LoginCoordinatorVirtualProxy: LoginCoordinating {
    weak var coordinating: LoginCoordinating?
    
    func start() {
        coordinating?.start()
    }
    
    func signUp() {
        coordinating?.signUp()
    }
}
