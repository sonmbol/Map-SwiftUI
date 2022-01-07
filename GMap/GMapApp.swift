//
//  GMapApp.swift
//  GMap
//
//  Created by ahmed abdalla on 05/01/2022.
//

import SwiftUI
import GoogleMaps
import Firebase

@main
struct GMapApp: App {
    
    init() {
        FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyAdAE05pEyETxfZptg5LdthkKPaocN6w3M")
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bg"), for: UIBarMetrics.default)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LoginViewModel())
        }
    }
}
