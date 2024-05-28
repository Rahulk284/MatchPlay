//
//  InputView.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/27/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
//    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
//            Text(title)
//                .foregroundColor(Color(.darkGray))
//                .fontWeight(.semibold)
//                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .frame(height: 50)
                    .background(Color(.white))
                    .cornerRadius(7)
            }
            else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .frame(height: 50)
                    .background(Color(.white))
                    .cornerRadius(7)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5.0)
//                            .stroke(Color(.systemGray4), lineWidth: 1)
//                    )
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), placeholder: "Email")
}
