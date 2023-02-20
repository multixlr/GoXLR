import SwiftUI
import CoreKit
import AudioKit

@main
struct GoXLR: App {
    private let app = App()
    
    @Environment(\.openURL) var openURL
        
    var body: some Scene {
        MenuBarExtra {
            VStack {
                Button("Configure") {
                    configure()
                }
                Menu("Immutable") {
                    Immutable()
                }
                Divider()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }
        } label: {
            Image(.icon_menubar)
        }
    }
    
    private func configure() {
        guard let url = URL.configuration else { return }
        openURL(url)
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
            Audio.shared.initialize()
        }
    }
}
extension GoXLR.App: AppBridge {
    internal func notifications() async -> CoreKit.Notifications.State { .unknown }
    internal func requestNotifications() {}
    internal func app(state: CoreKit.System.App.State) {}
    internal func user(state: CoreKit.System.User.State) {}
}
