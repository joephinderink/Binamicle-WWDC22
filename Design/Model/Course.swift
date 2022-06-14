//
//  Course.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var courses = [
    Course(index: 1, title: "Hey there! \n(Swipe this card left before clicking Get Started 😉)", subtitle: "Join me", text: "\nWelcome to Binamcicle. This is probably not your first app so I'll keep it short 🫡 \n\nPlease swipe left untill you've reached the end of the introduction ✅ \n\nThen click Get Started ❤️", image: "", background: "Background 5", logo: "welcomeMemoji"),
    Course(index: 2, title: "Binamicle", subtitle: "20 sections - 3 hours", text: "For WWDC22 I decided to create an app in which you get some knowledge about binary. \n\nI've accomplished this using three methods of translating to binary ✅", image: "boxMemoji", background: "Background 4", logo: "boxMemoji"),
    Course(index: 2, title: "What even is binary?", subtitle: "20 sections - 3 hours", text: "In short, binary is a system used by computers, by which values are expressed in 0's and 1's.", image: "questionMemoji", background: "Background 4", logo: "questionMemoji"),
    Course(index: 3, title: "Computers and binary", subtitle: "20 sections - 3 hours", text: "\nA bit (short for binary digit) is the smallest unit of data on a computer; each bit has a single value of either 1 or 0. \n\nExecutable (ready-to-run) programs are often identified as binary files and given a file name extension of .bin. \n\nProgrammers often call executable files binaries.", image: "macbookMemoji", background: "Background 1", logo: "macbookMemoji"),
    Course(index: 4, title: "How does it work with numbers", subtitle: "20 sections - 3 hours", text: "Binary numbers look strange when they are written out directly. This is because the digits' weight increases by powers of 2. \n\nIn a digital numeral, the digit furthest to the right is the ones digit; the next digit to the left is the twos digit; next comes the fours digit, then the eights digit, then the 16s digit, then the 32s digit, and so on.\n\nThe decimal equivalent of a binary number can be found by summing all the digits. For example, the binary 10101 is equivalent to the decimal 1 + 4 + 16 = 21:", image: "mindblownMemoji", background: "Background 2", logo: "mindblownMemoji"),
    Course(index: 3, title: "The binary alphabet", subtitle: "20 sections - 3 hours", text: "There is also a binary alphabet. A for example is: 01000001, whereas a (not capital) is: 01100001. I'll be using this alphabet primarly in this app.", image: "ideaMemoji", background: "Background 1", logo: "ideaMemoji"),
    Course(index: 3, title: "Main technologies used", subtitle: "20 sections - 3 hours", text: "\nSwiftUI \n\nVisionKit \n\nSFSpeechRecognizer", image: "photoMemoji", background: "Background 1", logo: "photoMemoji"),
    Course(index: 3, title: "Let's get started!", subtitle: "20 sections - 3 hours", text: "I can explain binary for daaays to you, however, it's better to see it in action 🎯 Now click Get Started!", image: "startMemoji", background: "Background 1", logo: "startMemoji"),
]

var featuredCourses = [
    Course(index: 1, title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 9", background: "Background 5", logo: "Logo 2"),
    Course(index: 2, title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 3", logo: "Logo 3"),
    Course(index: 3, title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(index: 4, title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
]
