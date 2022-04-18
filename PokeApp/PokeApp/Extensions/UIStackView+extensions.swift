import Foundation
import UIKit

extension UIStackView {
    
    ///Allows to add more than one subview to a StackView
    public func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}
