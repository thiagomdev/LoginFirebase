import UIKit

enum SignUpFactory {
    static func make(
        noSessionCoordinator: NoSessionCoordinating
    ) -> UIViewController {
        let signUpCoordinator = SignUpCoordinator(
            noSessionCoordinator: noSessionCoordinator
        )
        let viewModel = SignUpViewModel()
        let signUp = SignUpViewController(viewModel: viewModel)
        signUp.coordinator = signUpCoordinator
        return signUp
    }
}
