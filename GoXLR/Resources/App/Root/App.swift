import CoreKit
import SwiftUI

@main
struct GoXLR: App {
    private let app = App()
    
    var body: some Scene {
        MenuBarExtra {
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        } label: {
            Image(.icon_menubar)
        }
    }
}

extension GoXLR {
    fileprivate class App {
        internal init() {
            setup()
        }
        
        private func setup() {
            bridges()
        }
        private func bridges() {
            Core.shared.initialize(with: self)
        }
    }
}

extension GoXLR.App: AppBridge {
    internal func notifications() async -> CoreKit.Notifications.State { .unknown }
    internal func requestNotifications() {}
    internal func app(state: CoreKit.System.App.State) {}
    internal func user(state: CoreKit.System.User.State) {}
}
