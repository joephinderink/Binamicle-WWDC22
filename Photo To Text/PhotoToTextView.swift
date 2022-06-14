//
//  PhotoToTextView.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct PhotoToTextView: View {
    @ObservedObject var recognizedContent = RecognizedContent()
    @State private var showScanner = false
    @State private var isRecognizing = false
    @EnvironmentObject var states : States
    @EnvironmentObject var text : TextItem
    
    
    @State var color: Color = .teal
    @State var selectedX: CGFloat = 0
    @State var x: [CGFloat] = [0, 0, 0, 0]
    
    @EnvironmentObject var model: Model
    @AppStorage("selectedTab") var selectedTab: Tab = .photo
    
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8) {
                Spacer()
                Image("photoMemoji")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(18)
                    .modifier(OutlineOverlay(cornerRadius: 18))
                
                Text("Photo to binary")
                    .font(.title).bold()
                    .padding(.bottom)
                //                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("We're gonna get started with translation text from a photo to binary using the binary alphabet! \n\n1. Press the Scan button \n\n2. Make a picture with some text in it \n\n 3. Click Save \n\n4. See your text translated into binary. \n\nThis is done using visionKit to recognize the text in the piture, and the strings are replaced with a model of the binary alphabet 📝")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                Form {
                    ForEach(recognizedContent.items, id: \.id) { textItem in
                        VStack {
                            Text("Original Text")
                                .fontWeight(.bold)
                            TextPreviewView(text: textItem.text)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text("Translated to binary")
                                .fontWeight(.bold)
                            TextPreviewView(text: textItem.newText)
                                .frame(alignment: .center)
                        }
                        
                    }
                    
                    
                    if isRecognizing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                            .padding(.bottom, 20)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            guard !isRecognizing else { return }
                            showScanner = true
                        }, label: {
                            HStack {
                                Text("Scan")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical)
                                Image(systemName: "doc.text.viewfinder")
                                    .font(.headline)
                            }
                        })
                        Spacer()
                    }
                    .navigationTitle("Photo to binary")
                }
                Section {
                    if !states.HomeScreen {
                        HStack {
                            Spacer()
                            Button (action: {
                                withAnimation {
                                    states.PhotoToBinary = false
                                    states.SpeechToBinary = true
                                    states.TextToBinary = false
                                    states.FirstWelcome = false
                                    states.HomeScreen = false
                                }
                            }, label: {
                                HStack {
                                    Text("Next")
                                        .fontWeight(.bold)
                                        .foregroundColor(.accentColor)
                                        .multilineTextAlignment(.leading)
                                        .padding(.vertical)
                                        .padding(.leading)
                                    Image(systemName: "chevron.right")
                                        .font(.headline)
                                }
                            })
                            .padding(.bottom, UIScreen.main.bounds.height * 0.07)
                            
                            
                            Spacer()
                        }
                    } else {
                        HStack {
                            Spacer()
                            Button (action: {
                                withAnimation {
                                    states.PhotoToBinary = false
                                    states.SpeechToBinary = false
                                    states.TextToBinary = false
                                    states.FirstWelcome = false
                                    states.HomeScreen = false
                                    states.Explanation = true
                                }
                            }, label: {
                                HStack {
                                    Text("Start Introduction Again")
                                        .fontWeight(.bold)
                                        .foregroundColor(.accentColor)
                                        .multilineTextAlignment(.leading)
                                        .padding(.vertical)
                                        .padding(.leading)
                                    Image(systemName: "repeat")
                                        .font(.headline)
                                }
                            })
                            .padding(.bottom, UIScreen.main.bounds.height * 0.07)
                            
                            Spacer()
                        }
                    }
                }
                .sheet(isPresented: $showScanner, content: {
                    ScannerView { result in
                        switch result {
                        case .success(let scannedImages):
                            isRecognizing = true
                            
                            TextRecognition(scannedImages: scannedImages,
                                            recognizedContent: recognizedContent) {
                                // Text recognition is finished, hide the progress indicator.
                                isRecognizing = false
                            }
                                            .recognizeText()
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                        showScanner = false
                        
                    } didCancelScanning: {
                        // Dismiss the scanner controller and the sheet.
                        showScanner = false
                    }
                })
            }
        }
    }
}


struct PhotoToTextView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoToTextView()
            .environmentObject(States())
            .environmentObject(Model())
    }
}

