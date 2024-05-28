//
//  LoginView.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/27/24.
//

import SwiftUI
//STILL NEED TO ADD GOOGLE AND APPLE LOG IN OPTION (may not do apple if we cant figure it out)
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BgColor")
                .ignoresSafeArea()
                VStack {
                    Image("TempLogo")//THIS IS TEMPORARY
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 200)
                        .padding(.top, 6)
                    
                    VStack(spacing: 8) {
                        InputView(text: $email, placeholder: "Email")
                            .autocapitalization(.none)
                        
                        InputView(text: $password, placeholder: "Password", isSecureField: true)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    Button {
                        print("Logging user in...")
                    } label: {
                        HStack {
                            Text("Log In")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 79, height: 48)
                    }
                    .background(Color(.systemGreen))
                    .cornerRadius(32)
                    
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("Dont have an account?")
                            Text("Sign Up")
                                .foregroundColor(Color(.systemGreen))
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                        .padding(.top, 20)
                        .fontWeight(.semibold)
                        
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoginView()
}
