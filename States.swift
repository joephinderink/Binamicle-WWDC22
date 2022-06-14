//
//  States.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import Foundation

class States: ObservableObject {
    @Published var home = false
    @Published var person = false
    @Published var splashView: Bool = false
    @Published var SpeechToBinary: Bool = false
    @Published var TextToBinary: Bool = false
    @Published var PhotoToBinary: Bool = false
    @Published var FirstWelcome: Bool = false
    @Published var HomeScreen: Bool = false
    @Published var Explanation: Bool = true
    @Published var Ending: Bool = false
}


