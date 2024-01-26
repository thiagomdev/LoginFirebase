import UIKit

protocol RootCoordinating {
    func display(viewController: UIViewController)
}

final class RootCoordinator: RootCoordinating {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func display(viewController: UIViewController) {
        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                window.rootViewController = viewController
                window.makeKeyAndVisible()
                window.layoutSubviews()
        })
    }
}
