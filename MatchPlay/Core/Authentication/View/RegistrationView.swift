//
//  RegistrationView.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/28/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
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
                    InputView(text: $firstName,
                              placeholder: "First Name")
                    
                    InputView(text: $lastName,
                              placeholder: "Last Name")
                    
                    InputView(text: $email,
                              placeholder: "Email")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, 
                              placeholder: "Password",
                              isSecureField: true)
                        .autocapitalization(.none)
                }
                .padding(.horizontal, 40)
                .padding(.top, 12)
                
                Button {
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                       firstName: firstName,
                                                       lastName: lastName)
                    }
                } label: {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 79, height: 48)
                }
                .background(Color(.systemGreen))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(32)
                
//                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Joined us before?")
                        Text("Log In")
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

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !firstName.isEmpty
        && !lastName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
