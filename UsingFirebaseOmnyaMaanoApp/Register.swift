//
//  Register.swift
//  Maano_OmnyaPart
//
//  Created by Omnya Kamal  on 06/12/2022.
//

import SwiftUI


struct Register: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var businessName = ""
    @State private var adress = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationView {
            VStack {//Main VStack that holds all the items
                //This is the img in the begining
                Image("Illustration")
                Text("Sign Up").modifier(PageNameModifier())
                //Using rusable component OmnyaformFeilds by calling it//
                //Email feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Email")), imgName: Binding.constant("envelope.fill") , feildValue:$email)
                //Password feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" ******")), imgName: Binding.constant("lock.fill") , feildValue:$password)
                //Phone feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" 05xxxxxxxx")), imgName: Binding.constant("phone.fill") , feildValue:$phone)
                
//                VStack {
//                    HStack {
//                        Image(systemName: "phone.fill")
//                            .foregroundColor(Color("MaanoGreen"))
//
//                        TextField(" 05xxxxxxxx",
//                                  text: $phone)
//
//                    }
//                    .modifier(HstackModifier())
//                }
//                .modifier(VstackModifier())
//                .padding([.leading, .trailing])
                
                //businessName feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Business Name")), imgName: Binding.constant("person.fill") , feildValue:$businessName)
                //Adress feild:
                OmnyaTextFeilds(placeHolder:(Binding.constant(" Adress")), imgName: Binding.constant("mappin") , feildValue:$adress)
                ///Sign Up Button
                Button {
                    //This guard let phone because we are taking the phone from the user as a String
                    guard let phone = try? Int(phone, format: .number) else {return}
                    //Calling func addMannoUser() as an action to the button when it is clicked
                    addMannoUser (email:email , password:password , phone:phone , businessName:businessName ,adress:adress)
                    
                } label: {
                    Text("Sign Up")
                        .modifier(ButtonModifier())
                }//End of Button & its lable
                
                //Already a memner text
                HStack{
                    Text("Already a member?")
                    NavigationLink(destination: Login() ){
                        Text("Login")
                        .foregroundColor(Color("MaanoOrange")).underline()}
                    Text("here.")
                }
                
            }//End of main Vstack
        }//End of NavigationView
    }
    // func addMannoUser () used to create and save records from the app to CloudKit container
    func addMannoUser (email:String , password:String , phone:Int , businessName:String ,adress:String)//passing all the record feilds together with their data types
    {
//        let record = CKRecord(recordType: "MannoUsers")
//        record["email"] = email
//        record["password"] = password
//        record["phone"] = phone
//        record["businessName"] = businessName
//        record["adress"] = adress
//        CKContainer.init(identifier: "iCloud.CloudKitLearnerExample").publicCloudDatabase.save(record){
//            record, error in
//            guard error == nil else {
//                print(error?.localizedDescription)
//                return
//            }
//        }
    }

}


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

