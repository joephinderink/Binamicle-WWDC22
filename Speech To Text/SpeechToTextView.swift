//
//  SpeechToTextView.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI
import Speech


struct SpeechToTextView: View {
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    @EnvironmentObject var states : States
    
    var translationSpeech: String {
        let dictionary = [
            "A": "01000001(A)",
            "B": "01000010(B)",
            "C": "01000011(C)",
            "D": "01000100(D)",
            "E": "01000101(E)",
            "F": "01000110(F)",
            "G": "01000111(G)",
            "H": "01001000(H)",
            "I": "01001001(I)",
            "J": "01001010(J)",
            "K": "01001011(K)",
            "L": "01001100(L)",
            "M": "01001101(M)",
            "N": "01001110(N)",
            "O": "01001111(O)",
            "P": "01010000(P)",
            "Q": "01010001(Q)",
            "R": "01010010(R)",
            "S": "01010011(S)",
            "T": "01010100(T)",
            "U": "01010101(U)",
            "V": "01010110(V)",
            "W": "01010111(W)",
            "X": "01011000(X)",
            "Y": "01011001(Y)",
            "Z": "01011010(Z)",
            "a": "01100001(a)",
            "b": "01100010(b)",
            "c": "01100011(c)",
            "d": "01100100(d)",
            "e": "01100101(e)",
            "f": "01100110(f)",
            "g": "01100111(g)",
            "h": "01101000(h)",
            "i": "01101001(i)",
            "j": "01101010(j)",
            "k": "01101011(k)",
            "l": "01101100(l)",
            "m": "01101101(m)",
            "n": "01101110(n)",
            "o": "01101111(o)",
            "p": "01110000(p)",
            "q": "01110001(q)",
            "r": "01110010(r)",
            "s": "01110011(s)",
            "t": "01110100(t)",
            "u": "01110101(u)",
            "v": "01110110(v)",
            "w": "01110111(w)",
            "x": "01111000(x)",
            "y": "01111001(y)",
            "z": "01111010(z)",
            //            "0": "0",
            //            "1": "1",
            //            "2": "10",
            //            "3": "11",
            //            "4": "100",
            //            "5": "101",
            //            "6": "110",
            //            "7": "111",
            //            "8": "1000",
            //            "9": "1001",
            //            "10": "1010",
            //            "11": "1011",
            //            "12": "1100",
            //            "13": "1101",
            //            "14": "1110",
            //            "15": "1111",
            //            "16": "10000",
            //            "17": "10001",
            //            "18": "10010",
            //            "19": "10011",
            //            "20": "10100",
            //            "21": "10101",
            //            "22": "10110",
            //            "23": "10111",
            //            "24": "11000",
            //            "25": "11001",
            //            "26": "11010",
            //            "27": "11011",
            //            "28": "11100",
            //            "29": "11101",
            //            "30": "11110",
            //            "31": "11111",
            //            "32": "100000",
            //            "33": "100001",
            //            "34": "100010",
            //            "35": "100011",
            //            "36": "100100",
            //            "37": "100101",
            //            "38": "100110",
            //            "39": "100111",
            //            "40": "101000",
            //            "41": "101001",
            //            "42": "101010",
            //            "43": "101011",
            //            "44": "101100",
            //            "45": "101101",
            //            "46": "101110",
            //            "47": "101111",
            //            "48": "110000",
            //            "49": "110001",
            //            "50": "110010",
            //            "51": "110011",
            //            "52": "110100",
            //            "53": "110101",
            //            "54": "110110",
            //            "55": "110111",
            //            "56": "111000",
            //            "57": "111001",
            //            "58": "111010",
            //            "59": "111011",
            //            "60": "111100",
            //            "61": "111101",
            //            "62": "111110",
            //            "63": "111111",
            //            "64": "1000000",
            //            "65": "1000001",
            //            "66": "1000010",
            //            "67": "1000011",
            //            "68": "1000100",
            //            "69": "1000101",
            //            "70": "1000110",
            //            "71": "1000111",
            //            "72": "1001000",
            //            "73": "1001001",
            //            "74": "1001010",
            //            "75": "1001011",
            //            "76": "1001100",
            //            "77": "1001101",
            //            "78": "1001110",
            //            "79": "1001111",
            //            "80": "1010000",
            //            "81": "1010001",
            //            "82": "1010010",
            //            "83": "1010011",
            //            "84": "1010100",
            //            "85": "1010101",
            //            "86": "1010110",
            //            "87": "1010111",
            //            "88": "1011000",
            //            "89": "1011001",
            //            "90": "1011010",
            //            "91": "1011011",
            //            "92": "1011100",
            //            "93": "1011101",
            //            "94": "1011110",
            //            "95": "1011111",
            //            "96": "1100000",
            //            "97": "1100001",
            //            "98": "1100010",
            //            "99": "1100011",
            //            "100": "1100100"
        ]
        return dictionary.reduce(self.swiftUISpeech.outputText) { $0.replacingOccurrences(of: $1.key, with: $1.value) }
    }
    
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center, spacing: 8) {
                Spacer()
                Image("speechMemoji")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(18)
                    .modifier(OutlineOverlay(cornerRadius: 18))
                
                Text("Speech to binary")
                    .font(.title).bold()
                    .padding(.bottom)
                //                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Next we're capturing your voice, transcribing it using SFSpeechRecognizer and then translating it to binary. \n\n1. Press the record button \n\n2. Wait 1 second \n\n3. Say something, like your name \n\n4. See it translated in binary! \n\nthis primarly used SFSpeechRecognizer to be able to transcribe what you're saying. \n\nAfter transcribing it used the binary alphabet model again to translate it to binary 🧮")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                swiftUISpeech.getButton()
                    .padding()
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
            .padding(.bottom)
            Form{
                Text("Original Text")
                    .fontWeight(.bold)
                Text("\(swiftUISpeech.outputText)")
                    .font(.body)
                    .fontWeight(.bold)
                Text("Translated to binary")
                    .fontWeight(.bold)
                Text("\(translationSpeech)")
                    .font(.body)
                    .fontWeight(.bold)
            }
            Section {
                if !states.HomeScreen {
                    HStack {
                        Spacer()
                        Button (action: {
                            withAnimation {
                                states.PhotoToBinary = false
                                states.SpeechToBinary = false
                                states.TextToBinary = true
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
                        
                        Spacer()
                    }
                    .padding(.bottom, UIScreen.main.bounds.height * 0.07)
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
        }
    }
}

struct SpeechToTextView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechToTextView().environmentObject(SwiftUISpeech())
    }
}
