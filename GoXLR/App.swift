//
//  GoXLRApp.swift
//  GoXLR
//
//  Created by Eduard Shugar on 15.02.2023.
//

import SwiftUI

@main
struct GoXLR: App {
    @State var currentNumber: String = "1"

    var body: some Scene {
        MenuBarExtra {
            VStack(alignment: .center) {
                Text("Hello, world!")
                    .bold()
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
        } label: {
            Image(systemName: "1.circle")
        }

    }
}
