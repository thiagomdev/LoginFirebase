import UIKit

enum LoginFactory {
    static func make(
        noSessionCoordinator: NoSessionCoordinating
    ) -> UIViewController {
        let coordinator = LoginCoordinator(noSessionCoordinator: noSessionCoordinator)
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.coordinator = coordinator
        return viewController
    }
}
