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
    
    static func makeButton(
        icon: UIImage? = UIImage(),
        textColor: UIColor = .white,
        radius: CGFloat = 6,
        title: String? = String(),
        selector: Selector,
        font: UIFont,
        backgroundColor: UIColor = .purple.withAlphaComponent(0.2)
    ) -> UIButton {
        
        let button = UIButton()
        button.setImage(icon, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        button.titleLabel?.font = font
        button.titleLabel?.textColor = textColor
        button.layer.cornerRadius = radius
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
    static func makeForgotPassword(regularTitle: String, boldTitle: String, selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.80), .font: UIFont.systemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: regularTitle, attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.80), .font: UIFont.boldSystemFont(ofSize: 15)]
        attributedTitle.append(NSAttributedString(string: boldTitle, attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
    static func makeDivider(text: String) -> UIView {
        let containerView = UIView()
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(white: 1, alpha: 0.80)
        
        containerView.addSubview(label)
        
        NSLayoutConstraint.pin([
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        let dividerOne = UIView()
        dividerOne.backgroundColor =  UIColor(white: 1, alpha: 0.25)
        containerView.addSubview(dividerOne)
        
        NSLayoutConstraint.pin([
            dividerOne.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            dividerOne.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            dividerOne.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            dividerOne.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        let dividerTwo = UIView()
        dividerTwo.backgroundColor =  UIColor(white: 1, alpha: 0.25)
        containerView.addSubview(dividerTwo)
        
        NSLayoutConstraint.pin([
            dividerTwo.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            dividerTwo.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            dividerTwo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            dividerTwo.heightAnchor.constraint(equalToConstant: 1)
        ])
        return containerView
    }
}
