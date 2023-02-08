//
//  LoginTest.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 17/12/2022.
//

import SwiftUI
import Firebase

struct LoginTest: View {
    
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var toView = false //To go to the next view
    
    var body: some View {
        NavigationView {
        VStack {//Main VStack that holds all the items
            //This is the img in the begining
            Image("Illustration")
            Text("Login").modifier(PageNameModifier())
            //Using rusable component OmnyaformFeilds by calling it//
            //Email feild:
            OmnyaTextFeilds(placeHolder:(Binding.constant(" Email")), imgName: Binding.constant("envelope.fill") , feildValue:$email)
            //Password feild:
            OmnyaSecureFeilds(placeHolder:(Binding.constant(" ******")), imgName: Binding.constant("lock.fill") , feildValue:$password)
            //Sign Up Button
            Button {
                print("Button was tapped")
                signInUser(email: email, password: password)
            } label: {
                Text("Login")
                    .modifier(ButtonModifier())

            }
//            }.disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
            //                if signInProcessing {
            //                    ProgressView()
            //                    NavigationLink(destination: LoginTest)(show: self.$show), isActive: self.$show){
            //                        Text("")
            //                    }
            //                }
            if !signInErrorMessage.isEmpty {
                Text("Could not sign in user: \(signInErrorMessage)")
                    .foregroundColor(.red)
            }//End of Button & its lable
            //Don’t have an account nav to Register() view
            HStack{
                Text("Don’t have an account?")
                NavigationLink(destination: RegisterTest() ){
                    Text("Sign up")
                    .foregroundColor(Color("MaanoOrange")).underline()
                }.navigationBarBackButtonHidden(true)

//                Button {
//                    //self.show.toggle()
//
//
//                } label: {
//                    Text("Sign up")
//                        .foregroundColor(Color("MaanoOrange")).underline()
//                }
                //                    NavigationLink(destination: Register() ){
                //                        Text("Sign up")
                //                        .foregroundColor(Color("MaanoOrange")).underline()}
                Text("here.")
            }// Hstack
            
                    }//End of main Vstack
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $toView) {
            Addinvoice()
            //EditProfiletest()
        }//fullScreenCover

        }//End of NavigationView
        
        
    }// End of body
    func signInUser(email: String, password: String) {
        
        signInProcessing = true
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }
            switch authResult {
            case .none:
                print("Could not sign in user.")
                signInProcessing = false
            case .some(_):
                print("User signed in")
                toView = true
                signInProcessing = false
                withAnimation {
                    //viewRouter.currentPage = .homePage
                }
            }
            
        }
    }


}//End of struct LoginTest

    struct LoginTest_Previews: PreviewProvider {
        static var previews: some View {
            LoginTest()
        }
    }


