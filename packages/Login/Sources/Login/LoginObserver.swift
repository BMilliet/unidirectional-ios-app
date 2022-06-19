import Foundation
import AppCore
import Combine

final class LoginObserver: Observer {
    @Published public private(set) var state: LoginViewState = .empty
    var loginViewControllerStateSubscription: AnyCancellable?
    
    weak var eventReponder: LoginObserverResponder? {
        willSet { if newValue == nil { stopObserving() } }
    }
    
    func startObserving() {
        assert(self.eventReponder != nil)
        
        guard let _ = self.eventReponder else {
            return
        }
        
        if isObserving { return }
        
        subscribeToMainViewState()
    }
    
    func stopObserving() {
        loginViewControllerStateSubscription = nil
        NotificationCenter.default.removeObserver(self)
    }
    
    private func subscribeToMainViewState() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(loginFail),
            name: NSNotification.Name("\(LoginFailureAction())"), object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(loginSuccess),
            name: NSNotification.Name("\(LoginSuccessAction())"), object: nil
        )
        
        loginViewControllerStateSubscription =
        $state
            .receive(on: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] state in
                self?.received(state: state)
            }
    }
    
    @objc func loginFail() {
        state = .error
    }
    
    @objc func loginSuccess() {
        state = .success
    }
    
    private var isObserving: Bool {
        return (loginViewControllerStateSubscription != nil)
    }
    
    private func received(state: LoginViewState) {
        eventReponder?.render(newState: state)
    }
}
