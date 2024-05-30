//
//  User.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/30/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    
    
    //Make a profile image option!
    var initials: String {
        let firstInitial = firstName.first?.uppercased() ?? ""
        let lastInitial = lastName.first?.uppercased() ?? ""
        return firstInitial + lastInitial
    }
    
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, firstName: "Steve", lastName: "Jobs", email: "sjobs12@gmail.com")
}
