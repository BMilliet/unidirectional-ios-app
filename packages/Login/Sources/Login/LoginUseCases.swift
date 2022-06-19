import AppCore

struct LoginActionUseCase: UseCase {
    
    private let password: String
    private let dispatcher = ActionDispatcher()
    
    init(password: String) {
        self.password = password
    }
    
    func start() {
        if password == "123" {
            dispatcher.dispatch(LoginSuccessAction())
        } else {
            dispatcher.dispatch(LoginFailureAction())
        }
    }
}
