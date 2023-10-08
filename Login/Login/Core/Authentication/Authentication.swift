import UIKit

protocol Authentication {
    var buttonTitleColor: UIColor { get }
    var buttonBackgroundColor: UIColor { get }
}

protocol ValidationForm {
    func updateForm()
}
