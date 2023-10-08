import XCTest
@testable import Login

final class LoginViewModelTests: XCTestCase {
    
    func test_() {
        let (sut, loginSpy) = makeSut()
        
        sut.model = .init()
        
        XCTAssertEqual(loginSpy.expectedModel, .init())
    }
}

final class LoginViewModelSpy: LoginViewModeling {
    
    private(set) var expectedModel: Login.UserLogin? = .init()
    private(set) var expectedValidation: Bool?
    private(set) var expectedShouldEnableButton: Bool?
    
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
