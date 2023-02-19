import SwiftUI
import AudioKit

struct Content: View {
    @Environment(\.openURL) var openURL
    
    @State private var immutables = false

    var body: some View {
        VStack {
            Button("Configure") {
                configure()
            }
            Menu("Immutable") {
                ForEach(Audio.shared.devices) { device in
                    Text(device.name)
                }
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
    
    private func configure() {
        guard let url = URL.configuration else { return }
        openURL(url)
    }
}
