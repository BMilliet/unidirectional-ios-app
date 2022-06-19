import Foundation
import AppCore

final class AppObserver: Observer {
    
    weak var eventReponder: AppController?
    
    func startObserving() {
        subscribe()
    }
    
    func stopObserving() {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func subscribe() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(goToMenu),
            name: NSNotification.Name("\(LoginSuccessAction())"), object: nil
        )
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(goToLogin),
            name: NSNotification.Name("\(GoToLoginAction())"), object: nil
        )
    }
    
    @objc
    func goToMenu() {
        eventReponder?.goToMenu()
    }
    
    @objc
    func goToLogin() {
        eventReponder?.goToLogin()
    }
}
