//
//  UserForm.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 21/05/1444 AH.
//

import SwiftUI
//
//struct UserForm: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct UserForm_Previews: PreviewProvider {
//    static var previews: some View {
//        UserForm()
//    }
//}

struct UserForm: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        Form {
                 TextField("Name", text: $name)
                 TextField("Email", text: $email)
                 SecureField("Password", text: $password)
             }
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
    }
}
