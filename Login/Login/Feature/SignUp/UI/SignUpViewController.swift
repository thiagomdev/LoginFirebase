import UIKit

final class SignUpViewController: UIViewController {
    
    private lazy var iconImage = Utils.makeImage()
    private lazy var stackView = Utils.makeVerticalStackView()
    
    private lazy var emailTextField = Utils.makeTextField(placeholder: "Email")
    
    private lazy var passwordTextField = Utils.makeTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )
    
    private lazy var confirmPasswordTextField = Utils.makeTextField(
        placeholder: "Confirm Password",
        isSecureTextEntry: true
    )
    
    private lazy var signUpButton = Utils.makeButton(
        title: "Sign up",
        selector: #selector(didSignUp),
        font: .boldSystemFont(ofSize: 18)
    )
    
    private lazy var haveAndAccoutButton = Utils.makeRegularAndBoldTitleButton(
        regularTitle: "Have an account?",
        boldTitle: " Log In",
        selector: #selector(handleSignUp)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SignUpViewController {
    @objc
    private func didSignUp() {
        print("DEBUG: Did tap login button..")
    }
    
    @objc
    private func handleSignUp() {
        print("DEBUG: Did tap SignUp button..")
    }
}

extension SignUpViewController: ViewConfig {
    func buildViews() {
        createGradient()
        view.addSubview(iconImage)
        
        stackView.addSubviews(
            emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            signUpButton
        )

        view.addSubview(stackView)
        view.addSubview(haveAndAccoutButton)
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
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            
            haveAndAccoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            haveAndAccoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            haveAndAccoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func configUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}

extension SignUpViewController {
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
