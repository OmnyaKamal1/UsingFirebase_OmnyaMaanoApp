//
//  OmnyaSecureFeilds.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 17/12/2022.
//

import SwiftUI

struct OmnyaSecureFeilds: View {
    @Binding var placeHolder:String
    @Binding var imgName:String
    @Binding var feildValue:String
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "\(imgName)")
                        .foregroundColor(Color("MaanoGreen"))
                    
                    SecureField("\(placeHolder)",
                              text: $feildValue)
                    
                }
                .modifier(HstackModifier())
            }
            .modifier(VstackModifier())
            .padding([.leading, .trailing])
        }
    }
    
    struct OmnyaSecureFeilds_Previews: PreviewProvider {
        static var previews: some View {
            OmnyaSecureFeilds(placeHolder:(Binding.constant("placeHolder")), imgName: Binding.constant("envelope.fill") , feildValue:Binding.constant(""))
        }
    }

