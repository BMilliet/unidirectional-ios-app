import UIKit

struct AppRouter {
    let navigation: UINavigationController
    
    init(window: UIWindow) {
        self.navigation = UINavigationController()
        window.rootViewController = navigation
    }
    
    private func pushViewController(viewController: UIViewController) {
        let animated = navigation.topViewController != nil
        navigation?.pushViewController(viewController, animated: animated)
    }
}
