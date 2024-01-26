import UIKit

final class SignUpViewController: UIViewController {
    
    var coordinator: SignUpCoordinator?
    
    private var viewModel: SignUpViewModeling
    private lazy var iconImage = Utils.makeImage()
    private lazy var stackView = Utils.makeVerticalStackView()
    
    private lazy var emailTextField = Utils.makeTextField(placeholder: "Email")
    
    private lazy var passwordTextField = Utils.makeTextField(
        placeholder: "Password",
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
    
    init(viewModel: SignUpViewModeling) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SignUpViewController - viewDidAppear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SignUpViewController - viewDidDisappear")
        navigationController?.viewControllers.first?.removeFromParent()
    }
}

extension SignUpViewController {
    @objc
    private func didSignUp() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            viewModel.createUser(from: email, password: password)
            coordinator?.login()
        }
    }
    
    @objc
    private func handleSignUp() {
        coordinator?.login()
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

extension SignUpViewController: Authentication {
    var buttonTitleColor: UIColor {
        return viewModel.validation ? .white : UIColor(white: 1, alpha: 0.50)
    }
    
    var buttonBackgroundColor: UIColor {
        let purple = UIColor.purple
        let alpha = UIColor.purple.withAlphaComponent(0.5)
        return viewModel.validation ? purple : alpha
    }
}

extension SignUpViewController: ValidationForm {
    func updateForm() {
        signUpButton.isEnabled = viewModel.shouldEnableButton
        signUpButton.backgroundColor = buttonBackgroundColor
        signUpButton.setTitleColor(buttonTitleColor, for: .normal)
    }
    
    func setObserves() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
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

extension SignUpViewController: ViewConfig {
    func buildViews() {
        createGradient()
        view.addSubview(iconImage)
        
        stackView.addSubviews(
            emailTextField,
            passwordTextField,
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

            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            
            haveAndAccoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            haveAndAccoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            haveAndAccoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func configUI() {
        setObserves()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}
