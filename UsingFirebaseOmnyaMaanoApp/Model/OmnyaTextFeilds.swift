//
//  OmnyaTextFeilds.swift
//  Maano_OmnyaPart
//
//  Created by Omnya Kamal  on 07/12/2022.
//

import SwiftUI
//This struct
struct OmnyaTextFeilds: View {
    @Binding var placeHolder:String
    @Binding var imgName:String
    @Binding var feildValue:String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "\(imgName)")
                    .foregroundColor(Color("MaanoGreen"))
                
                TextField("\(placeHolder)",
                          text: $feildValue)
               
            }
            .modifier(HstackModifier())
        }
        .modifier(VstackModifier())
        .padding([.leading, .trailing])
        
    }    }

struct OmnyaTextFeilds_Previews: PreviewProvider {
    static var previews: some View {
        
        OmnyaTextFeilds(placeHolder:(Binding.constant("placeHolder")), imgName: Binding.constant("envelope.fill") , feildValue:Binding.constant(""))
    }
}
