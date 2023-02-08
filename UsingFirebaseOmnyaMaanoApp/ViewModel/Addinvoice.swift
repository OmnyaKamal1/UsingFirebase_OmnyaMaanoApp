//
//  Addinvoice.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 21/12/2022.
//

import SwiftUI

struct Addinvoice: View {
    @State private var isCominSoon = false
    @State private var showSheet: Bool = false
    @State private var profile = false
    @State private var showingAlert = false
    @State private var showWelcomeView = false
    @State private var countryIndex = false
    var countries = ["Oldest To Newest ","Newest To Oldest",]
    @State private var showEditProfile = false
    let countries1 =
    [" SS001"," SS002"," SS003"," SS004"," SS005"," SS006"," SS007"," SS008"," SS009"," SS0010"," SS0011"," SS0012",
    ]
    @State var Filter: [String] = ["Old to Recent ","Recent to Old"]
    // let countries  = CountryList
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button{
                        profile.toggle()
                        
                    }label:{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 36.0, height: 36.0)
                        
                    }
                    
                    
                    .padding()
                    .fullScreenCover(isPresented: $profile) {
                        EditProfiletest()
                    }
                    
                    Button{
                        showSheet.toggle()
                        //            هنا علامه + ماتطلع عندي
                    }label:{
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                        
                    }
                    .padding(.leading, 200.0)
                    .imageScale(.large)
                    .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
                    
                }
                    .fullScreenCover(isPresented: $showSheet) {
                        InvoiceTemplate()
                        
//                        Text("Explore the templates and start issuing your invoice").font(.headline)
//                            .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
//                        Text("Sales Invoice Templates").font(.subheadline)
//                            .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
//                        ZStack {
//                            Image("in1")
//
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//
//                                .frame(width: 300, height: 200)
//                                .cornerRadius(20)
//
//                            Button(" Sales (Product)") {
//                                showingAlert = true
//                            }.foregroundColor(.white)
//                                .frame(width: 300, height: 30, alignment: .center)
//                                .background(Color(red: 0.396, green: 0.513, blue: 0.38))
//                                .clipShape(Rectangle())
//                                .padding(.top, 170.0)
//                                .alert("Sign up to continue An account must be created to keep track of your records and customize invoice with your provided information. ", isPresented: $showingAlert) {
//                                    Button("Sign up ", role: .cancel) { }
//                                }
//                        }
//
//                        ZStack{
//                            Image("in1")
//
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//
//                                .frame(width: 300, height: 200)
//                                .cornerRadius(20)
//                                .padding()
//                            Button(" Sales (Service)") {
//                                showingAlert = true
//                            }.foregroundColor(.white)
//                                .frame(width: 300, height: 30, alignment: .center)
//                                .background(Color(red: 0.396, green: 0.513, blue: 0.38))
//                                .clipShape(Rectangle())
//                                .padding(.top, 170.0)
//
//
//
//                                .presentationDetents([.large, .medium, .fraction(0.75)])
//                        }
                    }
                    
                    
                    .padding()
                    .accentColor(Color(.white))
                    .foregroundColor(Color(red: 0.396, green: 0.513, blue: 0.38))
                    .font(.headline)
                    .background(Color.white.ignoresSafeArea(edges: .top))
                    Picker (selection: $countryIndex,
                            label:
                                Text("Sort by")) {
                        ForEach(0 ..< countries.count){
                            
                            Text(self.countries[$0]).tag($0)
                            
                        }
                    }
                                .padding(.leading, 200.0)
                    NavigationView{
                        List {
                            ForEach (countries1, id: \.self) {
                                country in
                                NavigationLink(destination:
                                                Text (country)){
                                    HStack {
                                        Image(systemName: "doc.text.fill")
                                        Text (country)
                                    }//.padding ()
                                    //     .sheet(isPresented: countries1, content:
                                }
                                // .navigationTitle("invoice")
                                
                                // }.toolbar{ToolbarItem(placement: .navigationBarTrailing) {
                                // Button{
                                // login.toggle()
                                //
                                // }label:{
                                // Image(systemName: "person.circle.fill")
                                // .resizable()
                                // .frame(width: 36.0, height: 36.0)
                                
                            }}
                    }
                }
                
                
            }
            // .navigationTitle("invoice")
        }
    }
    
    
struct Addinvoice_Previews: PreviewProvider {
        static var previews: some View {
        Addinvoice()
        }
            }
            
         
