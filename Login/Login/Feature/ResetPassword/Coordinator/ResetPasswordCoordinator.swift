import UIKit

protocol ResetPasswordCoordinating: AnyObject {
    func login()
}

final class ResetPasswordCoordinator {
    private let noSessionCoordinator: NoSessionCoordinating
    
    init(noSessionCoordinator: NoSessionCoordinating) {
        self.noSessionCoordinator = noSessionCoordinator
    }
}

extension ResetPasswordCoordinator: ResetPasswordCoordinating {
    func login() {
        noSessionCoordinator.login()
    }
}
