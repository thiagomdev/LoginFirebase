import UIKit

protocol LoginCoordinating: AnyObject {
    func signUp()
    func resetPassword()
}

final class LoginCoordinator {
    private let noSessionCoordinator: NoSessionCoordinating
    
    init(noSessionCoordinator: NoSessionCoordinating) {
        self.noSessionCoordinator = noSessionCoordinator
    }
}

extension LoginCoordinator: LoginCoordinating {
    func signUp() {
        noSessionCoordinator.signup()
    }
    
    func resetPassword() {
        noSessionCoordinator.resetPassword()
    }
}
