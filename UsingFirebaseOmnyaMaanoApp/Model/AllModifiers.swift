//
//  AllModifiers.swift
//  UsingFirebase_OmnyaMaanoApp
//
//  Created by Omnya Kamal  on 16/12/2022.
//

import SwiftUI
//******View Modifiers to be used in the code******//

// Modifier for Hstack that holds each TextField
struct HstackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            .padding()
            .background((Color.white).clipShape(RoundedRectangle(cornerRadius:10)))
    }
}
// Modifier for Vstack that makes border around each TextField
struct VstackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1))
    }
}
// Modifier for Button
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .bold()
            .font(.system(size: 20))
            .foregroundColor(.white)
            .background(Color("MaanoGreen"))
            .cornerRadius(10.0)
            .padding()
    }
}
// Modifier for text which is the page name
struct PageNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 30))
            .foregroundColor(Color("MaanoGreen"))
    }
}

struct AllModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AllModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AllModifiers()
    }
}
