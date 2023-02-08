//
//  ContentView.swift
//  mypage7Norah
//
//  Created by Norah Abass AlOtaibi on 19/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert1 = false
    @State private var showingAlert = false
    @State private var showWelcomeView = false
    @State private var showEditProfile = false
    @State private var Register = false
    
    
    var body: some View {
        //        NavigationView{
        VStack {
            Button{
                showEditProfile.toggle()
               
                
            }label:{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 36.0, height: 36.0)
                
            }
            .padding(.trailing, 301.0)
            .imageScale(.large)
            .foregroundColor(Color("MaanoGreen"))
            
            .padding()
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfiletest()
            }
            //مكان صفحه تسجيل الدخول للمستخدم
            //                NavigationLink ("Login", destination: mypage7Norah.Login()
            //                )
            
            Divider()
            //            Spacer()
            
            Text("Explore the templates and start issuing your invoice").font(.headline)
                .foregroundColor(Color("MaanoGreen"))
            Spacer()
            Text("Sales Invoice Templates").font(.subheadline)
                .foregroundColor(Color("MaanoGreen"))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 0.0)
                .bold()
            
            
            Spacer()
            ZStack {
                Image("in1")
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .padding()
                Button(" Sales (Product)") {
                    showingAlert1 = true
                }.foregroundColor(.white)
                    .frame(width: 300, height: 30, alignment: .center)
                    .background(Color("MaanoGreen"))
                    .clipShape(Rectangle())
                    .padding(.top, 170.0)
                    .fullScreenCover(isPresented: $showEditProfile) {
                        InvoiceTemplate()
                    }
                
                    .alert("Sign up to continue   An account must be created to keep track of your records and customize invoice with your provided information. ", isPresented: $showingAlert1) {
                        Button("Sign up ", role: .cancel)
                        { }
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
                    .background(Color("MaanoGreen"))
                    .clipShape(Rectangle())
                    .padding(.top, 170.0)
                
                
                // if user
                    .alert("Sign up to continue   An account must be created to keep track of your records and customize invoice with your provided information. ", isPresented: $showingAlert) {
                        //                            Button("Sign up ", role: .cancel) { }
                        //                        }
                        
                        Button{
                            Register.toggle()
                            
                        }label:{
                            Text("Sign up")}
                        
                        
                        
                        
                        
                    }
                Spacer()
                
            }
            .fullScreenCover(isPresented: $Register) {
                RegisterTest2()
            }
            
            
        }
        
        
    }
    //}
    struct ContentView2_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
