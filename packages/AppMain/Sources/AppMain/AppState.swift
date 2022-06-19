import AppCore

struct AppState {
    var routeState: AppRoute
    
    init(route: AppRoute) {
        self.routeState = route
    }
}
