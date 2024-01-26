import UIKit

enum ResetPasswordFactory {
    static func make(noSessionCoordinator: NoSessionCoordinating) -> UIViewController {
        let coordinator = ResetPasswordCoordinator(noSessionCoordinator: noSessionCoordinator)
        let viewModel = ResetPasswordViewModel()
        let reset = ResetPasswordViewController(viewModel: viewModel)
        reset.coordinator = coordinator
        return reset
    }
}
