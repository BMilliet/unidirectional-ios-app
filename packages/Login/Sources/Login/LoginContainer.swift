public final class LoginContainer {
    public init() {}
    
    public func makeLoginViewController() -> LoginViewController {
        let observer = makeLoginObserver()
        
        let controller = LoginViewController(
            observer: observer,
            loginAppUseCaseFactory: self
        )
        
        observer.eventReponder = controller
        
        return controller
    }
    
    private func makeLoginObserver() -> LoginObserver {
        return LoginObserver()
    }
}

extension LoginContainer: LoginAppUseCaseFactory {
    func makeLoginUseCase(password: String) -> LoginActionUseCase {
        return LoginActionUseCase(password: password)
    }
}
