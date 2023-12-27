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
        backgroundColor: .clear,
        isEnable: true
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
    }
    
    @objc
    private func handleGoogleLogin() {
        print("DEBUG: Did tap GoogleLogin button..")
    }
    
    @objc
    private func handleSignUp() {
        coordinator?.signUp()
    }
    
    @objc
    private func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.model.email = sender.text
        } else {
            viewModel.model.password = sender.text
        }
        updateForm()
    }
}

extension LoginViewController: Authentication {
    var buttonTitleColor: UIColor {
        return viewModel.validation ? .white : UIColor(white: 1, alpha: 0.50)
    }
    
    var buttonBackgroundColor: UIColor {
        let purple = UIColor.purple
        let alpha = UIColor.purple.withAlphaComponent(0.5)
        return viewModel.validation ? purple : alpha
    }
}

extension LoginViewController: ValidationForm {
    func updateForm() {
        loginButton.isEnabled = viewModel.shouldEnableButton
        loginButton.backgroundColor = buttonBackgroundColor
        loginButton.setTitleColor(buttonTitleColor, for: .normal)
    }
    
    func setObserves() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
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
        setObserves()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}
