import Foundation

public struct ActionDispatcher {
    public init() {}
    
    public func dispatch(_ action: Action) {
        let notificationName = NSNotification.Name("\(action)")
        NotificationCenter.default.post(name: notificationName, object: action)
    }
}
