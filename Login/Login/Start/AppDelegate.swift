import UIKit
import Firebase
import LeakedViewControllerDetector

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        delectMemoryLeak()
        FirebaseApp.configure()
        return run()
    }
}

extension AppDelegate {
    private func run() -> Bool {
        let window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        self.window = window
        
        let navigation = UINavigationController()

        appCoordinator = AppCoordinator(
            window: window,
            navigation: navigation
        )
        
        appCoordinator?.start()
        return true
    }
    
    private func delectMemoryLeak() {
        LeakedViewControllerDetector.onDetect() {
            leakedViewController, leakedView, message in
            return true
        }
    }
}
