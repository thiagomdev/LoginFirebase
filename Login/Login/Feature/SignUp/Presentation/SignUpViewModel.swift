import Foundation

protocol SignUpViewModeling {
    var model: UserLogin { get set }
    var validation: Bool { get }
    var shouldEnableButton: Bool { get }
}

final class SignUpViewModel {
    private var user: UserLogin
    
    init(user: UserLogin = .init()) {
        self.user = user
    }
}

extension SignUpViewModel: SignUpViewModeling {
    var model: UserLogin {
        get { user }
        set { user  = newValue }
    }
    
    var validation: Bool {
        return user.email?.isEmpty == false 
        && user.password?.isEmpty == false
        && user.confirmPassword?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return validation
    }
}
