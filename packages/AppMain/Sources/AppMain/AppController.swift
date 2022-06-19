import Foundation
import AppCore

import UIKit

public final class AppController {
    
    private var router: AppRouter
    private let observer: Observer
    
    init(observer: Observer, router: AppRouter) {
        self.observer = observer
        self.router = router
        
        self.observer.startObserving()
    }
    
    func goToMenu() {
        router.push(
            action: LoginSuccessAction(),
            viewController: UIViewController()
        )
    }
    
    func goToLogin() {
        router.push(
            action: GoToLoginAction(),
            viewController: AppContainer().makeLoginViewController()
        )
    }
    
    deinit {
        observer.stopObserving()
    }
}
