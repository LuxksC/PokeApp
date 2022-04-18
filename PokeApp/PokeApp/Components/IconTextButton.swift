import Foundation
import UIKit

struct IconTextButtonViewModel { //simulation of a view model that will pass information for the button
    let icon: UIImage
    let text: String
    let bgColor: UIColor?
    let contentColor: UIColor?
}

final class IconTextButton: UIButton { //making it a final class so nobody can subclass this class
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor.loginBg
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.loginBg
        label.font = UIFont.buttonLabel
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(label)
        clipsToBounds = true // if the content of a subview goes outside the button, it will not be shown
        layer.cornerRadius = Metrics.Style.buttonCornerRadius
    }
    
    required init?(coder: NSCoder) { // this init is reuired to deal with error if the component don't render
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: IconTextButtonViewModel) { // used to pass information to build the button
        icon.image = viewModel.icon
        label.text = viewModel.text
        if let bgColor = viewModel.bgColor {
            self.backgroundColor = bgColor
        }
        if let contColor = viewModel.contentColor {
            self.icon.tintColor = contColor
            self.label.textColor = contColor
        }
    }
    
    override func layoutSubviews() { // will use this function to set the constraints of the elements inside the button
        super.layoutSubviews()
        
        //icon constraints
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 32),
            icon.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        //text constraints
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
    }
    
    
    
}
