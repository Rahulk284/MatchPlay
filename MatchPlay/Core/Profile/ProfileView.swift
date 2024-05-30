//
//  ProfileView.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/28/24.
//

import SwiftUI
//THIS IS A TEMPORARY DESIGN
struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 3) {
                            Text(User.MOCK_USER.firstName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(User.MOCK_USER.lastName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                        }
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General") {
                HStack {
                    SettingsRowView(imageName: "gear",
                                    title: "Version",
                                    tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("Development")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            
            Section("Account") {
                Button  {
                    print("Sign out...")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemGreen))
                }
                
                Button  {
                    print("Delete Account")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor:.red)
                }
            }
        }
        
        
    }
}

#Preview {
    ProfileView()
}
