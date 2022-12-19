//
//  Login.swift
//  Maano_OmnyaPart
//
//  Created by Omnya Kamal  on 08/12/2022.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    
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
                OmnyaTextFeilds(placeHolder:(Binding.constant(" ******")), imgName: Binding.constant("lock.fill") , feildValue:$password)
                //Sign Up Button
                Button {
                    print("Button was tapped")
                    
                } label: {
                    Text("Login")
                        .modifier(ButtonModifier())
                }//End of Button & its lable
                //Don’t have an account nav to Register() view
                HStack{
                    Text("Don’t have an account?")
                    NavigationLink(destination: Register() ){
                        Text("Sign up")
                        .foregroundColor(Color("MaanoOrange")).underline()}
                    Text("here.")
                }
                
                
            }//End of main Vstack
        }//End of NavigationView
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
