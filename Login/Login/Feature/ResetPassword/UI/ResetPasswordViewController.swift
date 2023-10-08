import UIKit

final class ResetPasswordViewController: UIViewController {

    var coordinator: ResetPasswordCoordinator?
    
    private var viewModel: ResetPasswordViewModeling
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
        font: .boldSystemFont(ofSize: 18),
        isEnable: true
    )
    
    init(viewModel: ResetPasswordViewModeling = ResetPasswordViewModel()) {
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

extension ResetPasswordViewController: Authentication {
    var buttonTitleColor: UIColor {
        return viewModel.validation ? .white : UIColor(white: 1, alpha: 0.50)
    }
    
    var buttonBackgroundColor: UIColor {
        let purple = UIColor.purple
        let alpha = UIColor.purple.withAlphaComponent(0.5)
        return viewModel.validation ? purple : alpha
    }
}

extension ResetPasswordViewController {
    @objc
    private func didResetPassword() {
        coordinator?.login()
        print("DEBUG: Did tap reset password button..")
    }
    
    @objc
    private func textDidChange(_ sender: UITextField) {
        if sender == resetPasswordTextField {
            viewModel.model.email = sender.text
        }
        updateValidationFields()
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
    
    private func updateValidationFields() {
        resetPasswordButton.isEnabled = viewModel.shouldEnableButton
        resetPasswordButton.backgroundColor = buttonBackgroundColor
        resetPasswordButton.setTitleColor(buttonTitleColor, for: .normal)
    }
    
    private func setTextFieldObservers() {
        resetPasswordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
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
        setTextFieldObservers()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}
