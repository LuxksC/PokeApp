import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Private Variables
    
    private lazy var bgImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "charmander")
        image.layer.opacity = 0.2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.title
        label.text = "Let's Begin!"
        label.textAlignment = .center
        label.textColor = UIColor.systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pokemonsImage: UIImageView = {
        let image = UIImageView()
        let imageWithPadding = UIImage(named: "pokemons")?.addImagePadding(x: 64, y: 0)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 111
        image.contentMode = .scaleAspectFit
        image.image = imageWithPadding
        image.backgroundColor = #colorLiteral(red: 0.9277959466, green: 0.9277958274, blue: 0.9277958274, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var gmailLoginButton: IconTextButton = {
        let button = IconTextButton()
        button.configure(with: IconTextButtonViewModel(
            icon: UIImage(named: "gmail")!,
            text: "Continue with Google",
            bgColor: UIColor.systemBackground,
            contentColor: nil))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var appleLoginButton: IconTextButton = {
        let button = IconTextButton()
        button.configure(with: IconTextButtonViewModel(
            icon: UIImage(systemName: "applelogo")!,
            text: "Continue with Apple",
            bgColor: UIColor.black,
            contentColor: UIColor.white))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center // TAKE NOTE ***
        stack.spacing = Metrics.Margin.default
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Public variables
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.loginBg
        
        configureBgImageView()
        
        configureContentStackView()
        
        configureStackSubviews()
        
        configurePokeImage()
        
        configureGmailButton()
        
        configureAppleButton()
    }
    
    //MARK: - Private methods
    
    private func configureBgImageView() {
        view.addSubview(bgImageView)
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bgImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            bgImageView.heightAnchor.constraint(equalToConstant: (view.frame.size.width * 1.094))
        ])
    }
    
    private func configureContentStackView() {
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
    }

    private func configureStackSubviews() {
        contentStackView.addArrangedSubviews(titleLabel, pokemonsImage, gmailLoginButton, appleLoginButton)
    }

    private func configurePokeImage() {
        NSLayoutConstraint.activate([
            pokemonsImage.heightAnchor.constraint(equalToConstant: 222),
            pokemonsImage.widthAnchor.constraint(equalToConstant: 222),
        ])
    }
    
    private func configureGmailButton() {
        NSLayoutConstraint.activate([
            gmailLoginButton.heightAnchor.constraint(equalToConstant: Metrics.Size.buttonHeight),
            gmailLoginButton.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            gmailLoginButton.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
        ])
    }
    
    private func configureAppleButton() {
        NSLayoutConstraint.activate([
            appleLoginButton.heightAnchor.constraint(equalToConstant: Metrics.Size.buttonHeight),
            appleLoginButton.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            appleLoginButton.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
        ])
    }
}

