//
//  FeaturedItem.swift
//
//
//  Created by Joep Hinderink on 23/04/2022.
//

import SwiftUI

struct FeaturedItem: View {
    var course: Course
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image(course.logo)
                .resizable()
                .frame(width: 26, height: 26)
                .cornerRadius(10)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .modifier(OutlineOverlay(cornerRadius: 18))
            Text(course.title)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.text)
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

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeaturedItem(course: courses[0])
            FeaturedItem(course: courses[0])
                .environment(\.sizeCategory, .accessibilityLarge)
        }
    }
}
