//
//  MyApp.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TextItem())
                .environmentObject(States())
                .environmentObject(Model())
                .environmentObject(SwiftUISpeech())
        }
    }
}
