//
//  File.swift
//  UsingFirebaseOmnyaMaanoApp
//
//  Created by Omnya Kamal  on 17/12/2022.
//

import Foundation
import SwiftUI
struct Users: Codable, Identifiable {
    var id: String = UUID().uuidString
    var email: String?
    var password: String?
    var phone:String?
    var businessName: String?
    var adress:String?
}
