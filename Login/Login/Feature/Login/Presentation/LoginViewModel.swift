import Foundation
import Firebase

protocol LoginViewModeling {
    var model: UserLogin { get set }
    var validation: Bool { get }
    var shouldEnableButton: Bool { get }
    func signInUser(from email: String, password: String)
}

final class LoginViewModel {
    private var user: UserLogin
    private var auth: Auth = .auth()
    
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
        return user.email?.isEmpty == false 
        && user.password?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return validation
    }

    func signInUser(from email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Algo deu errado!")
            } else {
                self.user.email = email
                self.user.password = password
            }
        }
    }
}
