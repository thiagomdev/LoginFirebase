import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "firebase-logo")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 18
        return stack
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .init(white: 1, alpha: 0.1)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textAlignment = .justified
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.isSecureTextEntry = true
        textField.backgroundColor = .init(white: 1, alpha: 0.1)
        textField.clearButtonMode = .whileEditing
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController: ViewConfig {
    func buildViews() {
        createGradient()
        view.addSubview(iconImage)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        view.addSubview(stackView)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 120),
            iconImage.widthAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
    }
}

extension HomeViewController {
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

