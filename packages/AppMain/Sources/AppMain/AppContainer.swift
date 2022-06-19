import Login
import UIKit

public struct AppContainer {
    public init() {}
    
    public func makeAppController(window: UIWindow?) -> AppController {
        let observer = makeAppObserver()
        
        let controller = AppController(
            observer: observer,
            router: makeAppRouter(window: window)
        )
        
        observer.eventReponder = controller
        
        return controller
    }
    
    private func makeAppObserver() -> AppObserver {
        return AppObserver()
    }
    
    private func makeAppRouter(window: UIWindow?) -> AppRouter {
        return AppRouter(window: window)
    }
    
    func makeLoginViewController() -> LoginViewController {
        return LoginContainer().makeLoginViewController()
    }
}
