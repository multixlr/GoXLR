import SwiftUI
import CoreKit
import AudioKit

struct Immutable: View {
    @ObservedObject private var setter = Setter()
    
    var body: some View {
        VStack {
            Menu("Output") {
                Button {
                    setter.set(immutable: nil, for: .output)
                } label: {
                    Image(systemName: Settings.Audio.Output.immutable == nil ? "checkmark.circle.fill" : "circle")
                    Text("None")
                }
                Divider()
                ForEach(Audio.shared.outputs) { device in
                    Button {
                        setter.set(immutable: device, for: .output)
                    } label: {
                        Image(systemName: Settings.Audio.Output.immutable == device.uid ? "checkmark.circle.fill" : "circle")
                        Text(device.name)
                    }
                }
            }
            Menu("Input") {
                Button {
                    setter.set(immutable: nil, for: .input)
                } label: {
                    Image(systemName: Settings.Audio.Input.immutable == nil ? "checkmark.circle.fill" : "circle")
                    Text("None")
                }
                Divider()
                ForEach(Audio.shared.inputs) { device in
                    Button {
                        setter.set(immutable: device, for: .input)
                    } label: {
                        Image(systemName: Settings.Audio.Input.immutable == device.uid ? "checkmark.circle.fill" : "circle")
                        Text(device.name)
                    }
                }
            }
        }
    }
}

fileprivate class Setter: ObservableObject {
    public func set(immutable device: Audio.Device?, for source: Audio.Source, selected: Bool = true) {
        Audio.set(immutable: device, for: source, selected: selected)
        refresh()
    }
    private func refresh() {
        objectWillChange.send()
    }
}
