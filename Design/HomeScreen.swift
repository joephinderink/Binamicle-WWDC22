//
//  HomeScreen.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var model: Model
    @AppStorage("selectedTab") var selectedTab: Tab = .photo
    @AppStorage("showAccount") var showAccount = false
    
    init() {
        showAccount = false
    }
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .photo:
                    PhotoToTextView()
                case .speech:
                    SpeechToTextView()
                case .text:
                    TextToBinary()
                    //                case .home:
                    //                    HomeView()
                    //                case .explore:
                    //                    ExploreView()
                    //                case .notifications:
                    //                    NotificationsView()
                    //                case .library:
                    //                    LibraryView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            
            TabBar()
            
            //            if model.showModal {
            //                ModalView()
            //                    .accessibilityIdentifier("Identifier")
            //            }
        }
        .dynamicTypeSize(.large ... .xxLarge)
        //        .sheet(isPresented: $showAccount) {
        //            AccountView()
        //        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(Model())
    }
}
