import SwiftUI

@main
struct GoXLR: App {
    @Environment(\.scenePhase) var state

    var body: some Scene {
        MenuBarExtra {
            VStack(alignment: .center) {
                Text("Hello, world!")
                    .bold()
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .onChange(of: state) { state in
                        switch state {
                        case .active:
                            print("App is active")
                        case .inactive:
                            print("App is inactive")
                        case .background:
                            print("App is in background")
                        @unknown default:
                            print("App is in unknown state")
                        }
                    }
            }
        } label: {
            Image(systemName: "1.circle")
        }
    }
    
    init() {
        start()
    }
    
    private func start() {
        print("start called")
    }
}
