//
//  EditProfiletest.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 17/12/2022.
//

import SwiftUI
import Firebase

struct EditProfiletest: View {
    //    enum Mode {
    //      case new
    //      case edit
    //    }
    @State private var isClicked = false
    //@State var HideLogout = false
    @State var signOutProcessing = false
    @State private var Editemail = "Omnya@hotmail.com"
    @State private var Editpassword = "123456"
    @State private var Editphone = "0533992109"
    @State private var EditbusinessName = "Omnya Company"
    @State private var Editadress = "KSA, Riyadh"
    @State private var UserLogedOut = false
    //@State private var showPassword = false
    //var mode: Mode = .new
    var body: some View {
        NavigationView {
            VStack{
                //Profile LARGE icon:
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .modifier(LargeProfileIconModifier()).padding()
                
                //Form feilds:
                //Email feild:
                //OmnyaTextFeilds(placeHolder:(Binding.constant("\($Editemail)")), imgName: Binding.constant("envelope.fill") , feildValue:$Editemail).disabled(isClicked==false)
                //Password feild:
//                OmnyaSecureFeilds(placeHolder:(Binding.constant("\($Editpassword)")), imgName: Binding.constant("lock.fill") , feildValue:$Editpassword).disabled(isClicked==false)
                //Phone feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant("\($Editphone)")), imgName: Binding.constant("phone.fill") , feildValue:$Editphone).disabled(isClicked==false)
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
                OmnyaTextFeilds(placeHolder:(Binding.constant("\($Editphone)")), imgName: Binding.constant("person.fill") , feildValue:$EditbusinessName).disabled(isClicked==false)
                //Adress feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant("\($Editadress)")), imgName: Binding.constant("mappin") , feildValue:$Editadress).disabled(isClicked==false)
                
                //Logout Button
                Button {
                    print("Logout Button was tapped")
                    signOutUser()
                    //fetchUser()
                    
                    
                } label: {
                    Text("Logout")
                        .modifier(ButtonModifier())
                    
                    //.opacity(HideLogout ? 1 : 0) //This .opacity was used before to hide and show the logout button
                    
                }//End of Button & its lable
                
                //toolbar that contains the edit icon
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                        
                        Button(action: { isClicked.toggle()
                            //                        guard let phone = try? Int(phone, format: .number) else {return}
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
                                Image(systemName: "square.and.pencil").foregroundColor(Color("MaanoGreen"))
                                //                                .onTapGesture {
                                //                                    HideShowButtonFunc()
                                //                                }
                            }
                        }//End of Lable
                        )//End of Button
                        
                    }// End of ToolbarItem
                } // End of toolbar
               
                .fullScreenCover(isPresented: $UserLogedOut) {
                    ContentView()
                }
            }
            // Vstack
            .navigationBarBackButtonHidden(false)
        }
        // End of NavigationStack
    }
    func signOutUser() {
        signOutProcessing = true
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            //go to some view
            //viewRouter.currentPage = .signInPage
        }
        UserLogedOut = true
    }// End offunc signOutUser()
    
    func fetchUser() {
        let userUID = Auth.auth().currentUser?.uid
        
        Firestore.firestore().collection("Users").document(userUID!).getDocument { snapshot, error in
            if error != nil {
                // ERROR
                print(error?.localizedDescription)
            }
            else {
                let userPhone = snapshot?.get("phone")
                print(userPhone)
            }
            
        }
    }
    
}//struct EditProfiletes

struct EditProfiletest_Previews: PreviewProvider {
    static var previews: some View {
        EditProfiletest()
    }
}

