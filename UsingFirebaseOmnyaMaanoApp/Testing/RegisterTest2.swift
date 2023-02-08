//
//  RegisterTest2.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 17/12/2022.
//

import SwiftUI
import Firebase

struct RegisterTest2: View {
    @State var signUpProcessing = false
    @State var showPassword = false
    @State var signUpErrorMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var businessName = ""
    @State private var adress = ""
    @State private var toView = false //To go to the next view
    //@State private var confirmpassword = ""
    var db = Firestore.firestore()

    @State var user = Users()
    //private var db = Firestore.firestore()
    //    @State private var phone = "0"
    //    @State private var businessName = ""
    //    @State private var adress = ""
    //    @State private var showPassword = false
    var body: some View {
        NavigationView {
            VStack{
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
                //Phone feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" 05xxxxxxxx")), imgName: Binding.constant("phone.fill") , feildValue:$phone)
                
                //businessName feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Business Name")), imgName: Binding.constant("person.fill") , feildValue:$businessName)
                //Adress feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Adress")), imgName: Binding.constant("mappin") , feildValue:$adress)
                
            }//1st of 2nd VStack
            VStack{
                ///Sign Up Button
                Button {
                    signUpMaanoUser(email: email, password: password)
                    
                    //Calling func registerMaano() as an action to the button when it is clicked
                    print("Button clicked")
                } label: {
                    Text("Sign Up")
                        .modifier(ButtonModifier())
                } //.disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !confirmpassword.isEmpty && password == confirmpassword ? false : true)
                //End of Button & its lable
                //This is to be performed after clicking the button
                if signUpProcessing {
                    ProgressView()//ProgressView shown means that there are things performd in the backend
                }
                if !signUpErrorMessage.isEmpty {
                    Text("Failed creating account: \(signUpErrorMessage)").frame(height:50) //To show the error msg to the user ex: not matched, email already used...
                        .foregroundColor(.red)
                        .padding()
                }
                //Already a memner text
                HStack{
                    Text("Already a member?")
                    NavigationLink(destination: LoginTest() ){
                        Text("Login")
                        .foregroundColor(Color("MaanoOrange")).underline()}.navigationBarBackButtonHidden(true)

                    Text("here.")
                }//.padding(.top, 50.0)
            }//2nd of 2nd VStack
        }//End of main Vstack
            .navigationBarBackButtonHidden(true)
            .fullScreenCover(isPresented: $toView) {
                ContentView()
            }
        }
        //End of NavigationView
    }
    func signUpMaanoUser(email:String, password:String){
        signUpProcessing = true
        print("inside method")
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            let id = authResult?.user.uid
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
                toView = true
                //ContentView()//Navigate to the other view
                //viewRouter.currentPage = .homePage
            }
            self.user = Users(id: id!, email: email, password: password, phone: phone, businessName: businessName, adress:adress)
            do {
                let _ = try db.collection("Users").addDocument(data: ["id": id, "email": email, "password": password, "phone": phone, "businessName": businessName, "adress":adress ])
                       }
                       catch {
                           print(error.localizedDescription)
                       }
            
            
            
            
        }//End of Auth.auth().createUser
        
    
        
    }
}

struct RegisterTest2_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTest2()
    }
}
