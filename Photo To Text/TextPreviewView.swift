//
//  TextPreviewView.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct TextPreviewView: View {
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

struct TextPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TextPreviewView(text: "")
    }
}
