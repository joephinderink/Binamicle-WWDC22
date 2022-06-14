//
//  ContentView.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var states : States
    
    var body: some View {
        
        //FirstWelcomeView
        if states.Explanation {
            Explanation()
                .preferredColorScheme(.dark)
        }
        
        // Photo To Binary
        if states.PhotoToBinary {
            PhotoToTextView()
                .preferredColorScheme(.dark)
        }
        
        // Ending
        if states.Ending {
            Ending()
                .preferredColorScheme(.dark)
        }
        
        // Text To Binary
        if states.TextToBinary {
            TextToBinary()
                .preferredColorScheme(.dark)
        }
        
        // Speech To Binary
        if states.SpeechToBinary {
            SpeechToTextView()
                .preferredColorScheme(.dark)
        }
        
        // HomeScreen
        if states.HomeScreen {
            HomeScreen()
                .preferredColorScheme(.dark)
        }
    }
}

