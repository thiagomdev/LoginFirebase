import Foundation

protocol ResetPasswordViewModeling {
    var model: UserLogin { get set }
    var validation: Bool { get }
    var shouldEnableButton: Bool { get }
}

final class ResetPasswordViewModel {
    private var user: UserLogin
    
    init(user: UserLogin = .init()) {
        self.user = user
    }
}

extension ResetPasswordViewModel: ResetPasswordViewModeling {
    var model: UserLogin {
        get { user }
        set { user  = newValue }
    }
    
    var validation: Bool {
        return user.email?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return validation
    }
}
