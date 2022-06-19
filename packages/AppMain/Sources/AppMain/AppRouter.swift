import UIKit
import AppCore

public final class AppRouter {
    let navigation: UINavigationController
    
    var action: Action?
    
    public init(window: UIWindow?) {
        self.navigation = UINavigationController()
        window?.rootViewController = navigation
        
        
        // mock navigation
        initNavigation()
    }
    
    func push(action: Action, viewController: UIViewController) {
        let animated = navigation.topViewController != nil
        self.action = action
        navigation.pushViewController(viewController, animated: animated)
    }
    
    private func initNavigation() {
        let action = GoToLoginAction()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let notificationName = NSNotification.Name("\(GoToLoginAction())")
            NotificationCenter.default.post(name: notificationName, object: GoToLoginAction())
        })
    }
}
