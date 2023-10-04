import UIKit

enum Utils {
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
}
