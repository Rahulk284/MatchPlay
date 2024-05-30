//
//  ContentView.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            }
            else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
