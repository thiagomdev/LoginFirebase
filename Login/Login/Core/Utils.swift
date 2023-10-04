import UIKit

enum Utils {
    static func makeImage() -> UIImageView {
        let icon = UIImageView()
        icon.image = UIImage(named: "firebase-logo")
        icon.contentMode = .scaleAspectFit
        return icon
    }
    
    static func makeVerticalStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }
    
    static func makeTextField(placeholder: String, isSecureTextEntry: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .justified
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.isSecureTextEntry = isSecureTextEntry
        textField.backgroundColor = .init(white: 1, alpha: 0.1)
        textField.clearButtonMode = .whileEditing
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
        return textField
    }
    
    static func makeButton(title: String, selector: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 6
        button.backgroundColor = .purple.withAlphaComponent(0.2)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.isEnabled = false
        return button
    }
    
    static func makeForgotPassword(regularTitle: String, boldTitle: String) -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.80), .font: UIFont.systemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: regularTitle, attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.80), .font: UIFont.boldSystemFont(ofSize: 15)]
        attributedTitle.append(NSAttributedString(string: boldTitle, attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
}
