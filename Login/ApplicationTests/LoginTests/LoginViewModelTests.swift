import XCTest
@testable import Login

final class LoginViewModelTests: XCTestCase {
    
    private var fixture = UserLogin.fixture()
    
    func test_userConfirmPassword_ShouldReturnAnValidConfirmPassword() {
        let (sut, loginSpy) = makeSut()
        let confirmPassword = fixture.confirmPassword
        loginSpy.expectedModel?.confirmPassword = confirmPassword
        
        sut.model.confirmPassword = confirmPassword
        
        XCTAssertEqual(loginSpy.expectedModel?.confirmPassword, confirmPassword)
    }
    
    func test_userPassword_ShouldReturnAnValidPassword() {
        let (sut, loginSpy) = makeSut()
        loginSpy.expectedModel?.password = fixture.password
        
        sut.model.password = fixture.password
        
        XCTAssertEqual(loginSpy.expectedModel?.password, fixture.password)
    }
    
    func test_userEmail_ShouldReturnAnValidEmail() {
        let (sut, loginSpy) = makeSut()
        loginSpy.expectedModel?.email = fixture.email
        
        sut.model.email = fixture.email
        
        XCTAssertEqual(loginSpy.expectedModel?.email, fixture.email)
    }
    
    func test_dataModelObject_ShouldReturnUserLoginModel() {
        let (sut, loginSpy) = makeSut()
        
        loginSpy.expectedModel = .fixture()
        
        sut.model = .fixture()

        XCTAssertEqual(loginSpy.expectedModel, .fixture())
    }
}

final class LoginViewModelSpy: LoginViewModeling {
    
    var expectedModel: Login.UserLogin? = .init()
    var expectedValidation: Bool?
    var expectedShouldEnableButton: Bool?
    
    var model: Login.UserLogin {
        get { expectedModel ?? .init() }
        set { expectedModel = newValue }
    }
    
    var validation: Bool {
        return expectedValidation ?? false
    }
    
    var shouldEnableButton: Bool {
        return expectedShouldEnableButton ?? false
    }
}

extension LoginViewModelTests {
    private func makeSut() -> (
        sut: LoginViewModel,
        loginSpy: LoginViewModelSpy
    ) {
        let loginSpy = LoginViewModelSpy()
        let sut = LoginViewModel()
        return (sut, loginSpy)
    }
}
