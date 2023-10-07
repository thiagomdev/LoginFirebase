import Foundation

final class LoginCoordinatorVirtualProxy: LoginCoordinating {
    weak var coordinating: LoginCoordinating?
    
    func start() {
        coordinating?.start()
    }
    
    func signUp() {
        coordinating?.signUp()
    }
}
