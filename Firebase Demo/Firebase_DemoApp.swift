//
//  Firebase_DemoApp.swift
//  Firebase Demo
//
//  Created by Diego Rivera on 2/18/23.
//

import SwiftUI
import Firebase

@main
struct Firebase_DemoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
