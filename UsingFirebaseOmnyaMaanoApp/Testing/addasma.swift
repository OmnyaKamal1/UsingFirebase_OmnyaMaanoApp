//
//  addasma.swift
//  mypage7Norah
//
//  Created by Norah Abass AlOtaibi on 19/05/1444 AH.
//

import SwiftUI

struct addasma: View {
    
    @State private var showSheet: Bool = false
    @State private var showingAlert = false
    @State private var showWelcomeView = false
    var body: some View {
        
        Button{
            showSheet.toggle()
//            هنا علامه + ماتطلع عندي
        }label:{
            Image(systemName: "plus")
                .resizable()
                .frame(width: 36.0, height: 36.0)
            
        }
        .padding(.leading, 301.0)
        .imageScale(.large)
        .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
        
        .padding()
//        Button("Toggle Sheet") {
//            showSheet.toggle()
//        }
        .sheet(isPresented: $showSheet) {
            
            
            Text("Explore the templates and start issuing your invoice").font(.headline)
                .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
            Text("Sales Invoice Templates").font(.subheadline)
                .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
            ZStack {
                Image("in1")
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                
                
                
                Button(" Sales (Product)") {
                    showingAlert = true
                }.foregroundColor(.white)
                    .frame(width: 300, height: 30, alignment: .center)
                    .background(Color(red: 0.396, green: 0.513, blue: 0.38))
                    .clipShape(Rectangle())
                    .padding(.top, 170.0)
                    .alert("Sign up to continue   An account must be created to keep track of your records and customize invoice with your provided information. ", isPresented: $showingAlert) {
                        Button("Sign up ", role: .cancel) { }
                    }
            }
            
            
            ZStack{
                Image("in1")
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .padding()
                Button(" Sales (Service)") {
                    showingAlert = true
                }.foregroundColor(.white)
                    .frame(width: 300, height: 30, alignment: .center)
                    .background(Color(red: 0.396, green: 0.513, blue: 0.38))
                    .clipShape(Rectangle())
                    .padding(.top, 170.0)
                // if user
//                    .alert("Sign up to continue   An account must be created to keep track of your records and customize invoice with your provided information. ", isPresented: $showingAlert) {
//                        Button("Sign up ", role: .cancel) { }
//                    }
//
                
                
                
                    .presentationDetents([.large, .medium, .fraction(0.75)])
            }
        }
    }
}
struct addasma_Previews: PreviewProvider {
    static var previews: some View {
        addasma()
    }
}
