//
//  AuthViewModel.swift
//  MatchPlay
//
//  Created by Rahul Kumar on 5/30/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser() //Important so that we can get user info from firebase
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, firstName: String, lastName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, firstName: firstName, lastName: lastName, email: email) //creates user object
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //uploads data to firestore
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create a user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil //takes back to login screen
            self.currentUser = nil //gets rid of current user object
        } catch {
            print("DUBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws{
        guard let user = Auth.auth().currentUser else { return }
        do {
            try await Firestore.firestore().collection("users").document(user.uid).delete()
            try await user.delete()
            
            self.currentUser = nil
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
        }
        
    }
    
//    func authenticateUser(withEmail email: String, password: String) async throws {
//        guard let user = Auth.auth().currentUser else { return }
//        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
//        do {
//            try await user.reauthenticate(with: credential)
//            print("User authenticated")
//        } catch {
//            print("DEBUG: Failed to reauthenticate with error \(error.localizedDescription)")
//        }
//    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
