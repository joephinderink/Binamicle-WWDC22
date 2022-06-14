//
//  Explanation.swift
//  
//
//  Created by Joep Hinderink on 25/04/2022.
//

import SwiftUI

struct Explanation: View {
    
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
                ForEach(courses) { course in
                    GeometryReader { proxy in
                        FeaturedItem(course: course)
                            .cornerRadius(30)
                            .modifier(OutlineModifier(cornerRadius: 30))
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minX / -10),
                                axis: (x: 0, y: 1, z: 0), perspective: 1
                            )
                            .shadow(color: Color("Shadow").opacity(0.3),
                                    radius: 30, x: 0, y: 30)
                            .overlay(
                                Image(course.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .offset(x: 50, y: -100)
                                    .frame(height: 230)
                                    .offset(x: proxy.frame(in: .global).minX / 2)
                            )
                            .padding(20)
                            .onTapGesture {
                                showCourse = true
                                selectedCourse = course
                            }
                            .accessibilityElement(children: .combine)
                            .accessibilityAddTraits(.isButton)
                    }
                }
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
                    states.PhotoToBinary = true
                    states.SpeechToBinary = false
                    states.TextToBinary = false
                    states.FirstWelcome = false
                    states.HomeScreen = false
                    states.Explanation = false
                }
            }, label: {
                HStack {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "chevron.right")
                        .font(.headline)
                }
            })
        }
    }
}

struct Explanation_Previews: PreviewProvider {
    static var previews: some View {
        Explanation()
    }
}
