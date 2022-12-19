//
//  UsingFirebase_OmnyaMaanoAppApp.swift
//  UsingFirebase_OmnyaMaanoApp
//
//  Created by Omnya Kamal  on 16/12/2022.
//

import SwiftUI
import Firebase

@main
struct UsingFirebaseOmnyaMaanoAppApp: App {
    init(){
        setupFirebase()
    }
    var body: some Scene {
        WindowGroup {
            //EditProfiletest()
            //RegisterTest2()
            //RegisterTest()
            //LoginTest()
            SplashscreenView()
        }
    }
}
private extension UsingFirebaseOmnyaMaanoAppApp {
    func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
}
