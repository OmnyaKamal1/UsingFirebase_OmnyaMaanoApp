//
//  RegisterTest.swift
//  UsingFirebase_OmnyaMaanoApp
//
//  Created by Omnya Kamal  on 16/12/2022.
//

import SwiftUI
import Firebase


struct RegisterTest: View {
    @State var signUpProcessing = false
    //@State var showPassword = false
    @State var signUpErrorMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    //private var db = Firestore.firestore()
    //    @State private var phone = "0"
    //    @State private var businessName = ""
    //    @State private var adress = ""
    //    @State private var showPassword = false
    
    var body: some View {
        NavigationView {
            VStack {//Main VStack that holds all the items
                //This is the img in the begining
                Image("Illustration")
                Text("Sign Up").modifier(PageNameModifier())
                //Using rusable component OmnyaformFeilds by calling it//
                //Email feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant("Email")), imgName: Binding.constant("envelope.fill") , feildValue:$email)
                //Password feild:
                OmnyaSecureFeilds(placeHolder:(Binding.constant("password must be 6 or more characters")), imgName: Binding.constant("lock.fill") , feildValue:$password)
                //.overlay(Image(systemName: showPassword ? "eye.slash" : "eye").onTapGesture { showPassword.toggle() }, alignment: .trailing)
                OmnyaSecureFeilds(placeHolder:(Binding.constant("Confirm password")), imgName: Binding.constant("lock.rotation") , feildValue:$confirmpassword)
                //.border(Color.red, width: confirmpassword != password ? 1 : 0)
                ///Sign Up Button
                Button {
                    signUpMaanoUser(email: email, password: password)//Calling func registerMaano() as an action to the button when it is clicked
                    print("Button clicked")
                    
                    
                    
                } label: {
                    Text("Sign Up")
                        .modifier(ButtonModifier())
                } .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !confirmpassword.isEmpty && password == confirmpassword ? false : true)
                //End of Button & its lable
                //This is to be performed after clicking the button
                if signUpProcessing {
                    ProgressView()//ProgressView shown means that there are things performd in the backend
                }
                if !signUpErrorMessage.isEmpty {
                    Text("Failed creating account: \(signUpErrorMessage)") //To show the error msg to the user ex: not matched, email already used...
                        .foregroundColor(.red)
                        .padding()
                }
                //Already a memner text
                HStack{
                    Text("Already a member?")
                    NavigationLink(destination: LoginTest() ){
                        Text("Login")
                        .foregroundColor(Color("MaanoOrange")).underline()}
                    Text("here.")
                }//.padding(.top, 50.0)
                
            }//End of main Vstack
        }.navigationBarBackButtonHidden(true)
        //End of NavigationView
    }
    func signUpMaanoUser(email:String, password:String){
        signUpProcessing = true
        print("inside method")
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            guard error == nil else {
                signUpErrorMessage = error!.localizedDescription
                signUpProcessing = false
                return
            }
            switch authResult {
            case .none:
                print("Could not create account.")
                signUpProcessing = false
            case .some(_):
                print("User created")
                signUpProcessing = false
                //ContentView()//Navigate to the other view
                //viewRouter.currentPage = .homePage
            }
            
            
        }//Endo of Auth.auth().createUser
        
    func AddInfo(username: String, email: String) {
            
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser
            
            
            
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                //let email = user.email
                //let photoURL = user.photoURL
                
                db.collection("users").document(uid).setData([
                    
                    "UID": uid,
                    "Username": username,
                    "Email": email,
                    "First Name": "",
                    "Last Name": ""])
                
                
            }
        }
        
        
    }
    
    
    struct RegisterTest_Previews: PreviewProvider {
        static var previews: some View {
            RegisterTest()
        }
    }
    
}
