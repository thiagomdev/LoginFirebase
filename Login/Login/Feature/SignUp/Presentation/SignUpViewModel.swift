import Foundation
import Firebase

protocol SignUpViewModeling {
    var model: UserLogin { get set }
    var validation: Bool { get }
    var shouldEnableButton: Bool { get }
    func createUser(from email: String, password: String)
}

final class SignUpViewModel {
    private var user: UserLogin
    private var auth: Auth = .auth()
    
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
    }
    
    var shouldEnableButton: Bool {
        return validation
    }
    
    func createUser(from email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self else { return }
            if error != nil {
                print("Algo deu errado!")
            } else {
                user.email = email
                user.password = password
            }
        }
    }
}
