//
//  EditProfile.swift
//  Maano_OmnyaPart
//
//  Created by Omnya Kamal  on 09/12/2022.
//

import SwiftUI
// Modifier for the LARGE profile icon.
struct LargeProfileIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 85 , height:85)
            .foregroundColor(Color("MaanoGreen"))
    }
}
//This extension NOT used in the code yet.
extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}



struct EditProfile: View {
    @State private var isClicked = false
    @State var HideLogout = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var businessName = ""
    @State private var adress = ""
    @State private var showPassword = false
    @State private var showContentView = false
    //This func NOT used in the code yet, it was used in logout button.
    func HideShowButtonFunc () {
        HideLogout.toggle()
    }
    var body: some View {
        ZStack{
            VStack{
                Button(action: {
                    self.showContentView = true
                }) {
                    Image(systemName: "arrow.left").resizable()
                }
                .sheet(isPresented: $showContentView) {
                    ContentView()
                }
            }
            NavigationStack {
                //Profile LARGE icon:
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .modifier(LargeProfileIconModifier()).padding()
                //Form feilds:
                //Email feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Email")), imgName: Binding.constant("envelope.fill") , feildValue:$email)
                //Password feild:
                //            OmnyaTextFeilds(placeHolder:(Binding.constant(" ******")), imgName: Binding.constant("lock.fill") , feildValue:$password)
                //Phone feild:
                //OmnyaformFeilds(placeHolder:(Binding.constant(" 05xxxxxxxx")), imgName: Binding.constant("phone.fill") , feildValue:$phone)
                //            VStack {
                //                HStack {
                //                    Image(systemName: "phone.fill")
                //                        .foregroundColor(Color("MaanoGreen"))
                //
                //                    TextField(" 05xxxxxxxx",
                //                              text: $phone)
                //
                //                }
                //                .modifier(HstackModifier())
                //            }
                //            .modifier(VstackModifier())
                //            .padding([.leading, .trailing])
                
                //businessName feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Business Name")), imgName: Binding.constant("person.fill") , feildValue:$businessName)
                //Adress feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Address")), imgName: Binding.constant("mappin") , feildValue:$adress)
                
                //Logout Button
                Button {
                    print("Button was tapped")
                    
                } label: {
                    Text("Logout")
                        .modifier(ButtonModifier())
                    
                    //.opacity(HideLogout ? 1 : 0) //This .opacity was used before to hide and show the logout button
                    
                }//End of Button & its lable
                
                //toolbar that contains the edit icon
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                        
                        Button(action: { isClicked.toggle()
                            guard let phone = try? Int(phone, format: .number) else {return}
                        },
                               label: {
                            if isClicked {
                                //This is after clicking the edit icon
                                Text("Done").foregroundColor(Color("MaanoGreen"))
                                //                                .onTapGesture {
                                //                                    HideShowButtonFunc()
                                //                                }
                            }
                            else {
                                //This is the NORMAL
                                HStack{
                                    Image(systemName: "square.and.pencil").foregroundColor(Color("MaanoGreen"))
                                    //                                .onTapGesture {
                                    //                                    HideShowButtonFunc()
                                    //                                }
                                    
                                }
                            }
                        }//End of Lable
                        )//End of Button
                        
                    }
                    // End of ToolbarItem
                } // End of toolbar
                
            }
            // End of NavigationStack
        }
    }
}
    
    struct EditProfile_Previews: PreviewProvider {
        static var previews: some View {
            EditProfile()
        }
    }

