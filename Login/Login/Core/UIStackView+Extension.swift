import UIKit

extension UIStackView {
    func addSubviews(_ view: UIView...) {
        view.forEach { views in
            addArrangedSubview(views)
        }
    }
}
