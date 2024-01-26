import UIKit

protocol SignUpCoordinating: AnyObject {
    func login()
}

final class SignUpCoordinator {
    private let noSessionCoordinator: NoSessionCoordinating
    
    init(noSessionCoordinator: NoSessionCoordinating) {
        self.noSessionCoordinator = noSessionCoordinator
    }
}

extension SignUpCoordinator: SignUpCoordinating {
    func login() {
        noSessionCoordinator.login()
    }
}
