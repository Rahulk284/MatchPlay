//
//  MatchPlayApp.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/22/24.
//

import SwiftUI
import Firebase

@main
struct MatchPlayApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
