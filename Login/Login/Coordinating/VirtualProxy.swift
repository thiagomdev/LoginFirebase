import Foundation

final class LoginCoordinatorVirtualProxy: LoginCoordinating {
    weak var coordinating: LoginCoordinating?
    
    func signUp() {
        coordinating?.signUp()
    }
    
    func resetPassword() {
        coordinating?.resetPassword()
    }
}
