import UIKit
import ViewCode
import AppCore

public final class LoginViewController: UIViewController {
    
    private let observer: Observer
    private let loginAppUseCaseFactory: LoginAppUseCaseFactory
    
    private lazy var field: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        return field
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    @objc
    private func buttonTap() {
        let useCase = loginAppUseCaseFactory
            .makeLoginUseCase(password: field.text ?? "")

        useCase.start()
    }
    
    required init?(coder: NSCoder) { return nil }
    init(
        observer: Observer,
        loginAppUseCaseFactory: LoginAppUseCaseFactory
    ) {
        self.observer = observer
        self.loginAppUseCaseFactory = loginAppUseCaseFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        observer.startObserving()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        observer.stopObserving()
    }
    
    public override func viewDidLoad() {
        setupView()
    }
}

extension LoginViewController: ViewCode {
    public func setSubviews() {
        view.addSubview(stack)
        stack.addArrangedSubview(UIView())
        stack.addArrangedSubview(field)
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(Spacer(size: 250, orientation: .height))
    }
    
    public func setConstraints() {
        stack.setAnchorsEqual(to: self.view)
        field.size(height: 60, width: 200)
        button.size(height: 80, width: 200)
    }
}

extension LoginViewController: LoginObserverResponder {
    func render(newState: LoginViewState) {
        switch newState {
        case .error:
            view.backgroundColor = .red
        case .success:
            view.backgroundColor = .green
        case .empty:
            view.backgroundColor = .gray
        }
    }
}
