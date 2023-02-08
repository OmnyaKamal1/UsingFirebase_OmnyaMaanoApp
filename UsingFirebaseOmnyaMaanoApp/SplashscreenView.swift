//
//  SplashScreen.swift
//  mypage7Norah
//
//  Created by Norah Abass AlOtaibi on 19/05/1444 AH.
//

import SwiftUI

struct SplashscreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("logo9")
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.1)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        
                        self.isActive = true
                        
                    }
                    
                 
                }
            }// End of onAppear
        }// End of else
    }// End of body
}// End of SplashscreenView struct
struct SplashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView()
    }
    
    
}
