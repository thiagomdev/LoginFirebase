import UIKit

final class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    private var viewModel: LoginViewModeling
    
    private lazy var iconImage = Utils.makeImage()
    private lazy var stackView = Utils.makeVerticalStackView()
    private lazy var emailTextField = Utils.makeTextField(placeholder: "Email")
    
    private lazy var passwordTextField = Utils.makeTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )
    
    private lazy var loginButton = Utils.makeButton(
        title: "Login",
        selector: #selector(didLogin),
        font: .boldSystemFont(ofSize: 18)
    )
    
    private lazy var forgotPasswordButton = Utils.makeRegularAndBoldTitleButton(
        regularTitle: "Forgot your password? ",
        boldTitle: "Get help signing in",
        selector: #selector(handleForgotPassword)
    )
    
    private lazy var divider = Utils.makeDivider(text: "OR")
    
    private lazy var googleLoginButton = Utils.makeButton(
        icon: UIImage(named: "google"),
        title: "  Log in with Google",
        selector: #selector(handleGoogleLogin),
        font: .boldSystemFont(ofSize: 16),
        backgroundColor: .clear
    )
    
    private lazy var dontHaveAndAccoutButton = Utils.makeRegularAndBoldTitleButton(
        regularTitle: "Don't have an account?",
        boldTitle: " Sign Up",
        selector: #selector(handleSignUp)
    )
    
    init(viewModel: LoginViewModeling =  LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension LoginViewController {
    @objc
    private func didLogin() {
        print("DEBUG: Did tap login button..")
    }
    
    @objc
    private func handleForgotPassword() {
        coordinator?.resetPassword()
        print("DEBUG: Did tap ForgotPassword button..")
    }
    
    @objc
    private func handleGoogleLogin() {
        print("DEBUG: Did tap GoogleLogin button..")
    }
    
    @objc
    private func handleSignUp() {
        coordinator?.signUp()
        print("DEBUG: Did tap SignUp button..")
    }
    
    @objc
    private func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.model.email = sender.text
            print("DEBUG: Email \(String(describing: sender.text))")
        } else {
            print("DEBUG: Password \(String(describing: sender.text))")
            viewModel.model.password = sender.text
        }
        print("DEBUG: Validation \(viewModel.validation)")
    }
}

extension LoginViewController: ViewConfig {
    func buildViews() {
        createGradient()
        view.addSubview(iconImage)
        
        stackView.addSubviews(
            emailTextField,
            passwordTextField,
            loginButton,
            forgotPasswordButton,
            divider,
            googleLoginButton
        )

        view.addSubview(stackView)
        view.addSubview(dontHaveAndAccoutButton)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 120),
            iconImage.widthAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            
            dontHaveAndAccoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            dontHaveAndAccoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dontHaveAndAccoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func configUI() {
        setTextFieldObservers()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}

extension LoginViewController {
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    private func setTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
