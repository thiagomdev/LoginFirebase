import Foundation

protocol LoginViewModeling {
    var model: UserLogin { get set }
    var validation: Bool { get }
}

final class LoginViewModel {
    private var user: UserLogin
    
    init(user: UserLogin = .init()) {
        self.user = user
    }
}

extension LoginViewModel: LoginViewModeling {
    var model: UserLogin {
        get { user }
        set { user  = newValue }
    }
    
    var validation: Bool {
        return user.email?.isEmpty == false && user.password?.isEmpty == false
    }
}
