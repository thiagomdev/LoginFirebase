import Foundation

extension UserLogin {
    static func fixture(
        email: String = "email@email.com",
        password: String = "123456",
        confirmPassword: String = "123456"
    ) -> Self {
        
        .init(
            email: email,
            password: password,
            confirmPassword: confirmPassword
        )
    }
}
