//
//  Ending.swift
//  
//
//  Created by Joep Hinderink on 25/04/2022.
//

import SwiftUI

struct Ending: View {
    
    @EnvironmentObject var states : States
    
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    var body: some View {
        
        VStack {
            TabView {
                endingItem()
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 30, x: 0, y: 30)
                    .overlay(
                        Image("partyMemoji")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 50, y: -100)
                            .frame(height: 230)
                    )
                    .padding(20)
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
            }
            .padding(.horizontal)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 460)
            .background(
                Image("Blob 1")
                    .offset(x: 250, y: -100)
                    .accessibility(hidden: true)
            )
            Button (action: {
                withAnimation {
                    states.PhotoToBinary = false
                    states.SpeechToBinary = false
                    states.TextToBinary = false
                    states.FirstWelcome = false
                    states.HomeScreen = true
                    states.Explanation = false
                    states.Ending = false
                }
            }, label: {
                HStack {
                    Text("Go Home")
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "house.fill")
                        .font(.headline)
                }
            })
        }
    }
}

struct Ending_Previews: PreviewProvider {
    static var previews: some View {
        Ending()
    }
}


struct endingItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image("partyMemoji")
                .resizable()
                .frame(width: 26, height: 26)
                .cornerRadius(10)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .modifier(OutlineOverlay(cornerRadius: 18))
            Text("We're done!")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("This is my take on implementing binary using multiple methods. \n\nI hope you enjoyed it and learned something from my app! \n\nI wish you a wonderful day 🤩 Explore everything again by clicking Go Home")
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .backgroundColor(opacity: 0.5)
    }
}
