import UIKit

final class ResetPasswordViewController: UIViewController {

    private lazy var iconImage = Utils.makeImage()
    private lazy var stackView = Utils.makeVerticalStackView()
    private lazy var resetPasswordTextField = Utils.makeTextField(placeholder: "Reset password")
    
    private lazy var passwordTextField = Utils.makeTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )
    
    private lazy var resetPasswordButton = Utils.makeButton(
        title: "Send reset Link",
        selector: #selector(didResetPassword),
        font: .boldSystemFont(ofSize: 18)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ResetPasswordViewController {
    @objc
    private func didResetPassword() {
        print("DEBUG: Did tap login button..")
    }
}

extension ResetPasswordViewController: ViewConfig {
    func buildViews() {
        createGradient()
        view.addSubview(iconImage)
        
        stackView.addSubviews(
            resetPasswordTextField,
            resetPasswordButton
        )

        view.addSubview(stackView)
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
            
            resetPasswordTextField.heightAnchor.constraint(equalToConstant: 48),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func configUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}

extension ResetPasswordViewController {
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
