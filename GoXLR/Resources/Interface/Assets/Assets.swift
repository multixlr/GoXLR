import SwiftUI

extension Image {
    internal enum Asset {
        case icon_menubar
    }
}

extension Image {
    internal init(_ asset: Asset) {
        switch asset {
        case .icon_menubar:
            self.init("icon/menubar")
        }
    }
}
