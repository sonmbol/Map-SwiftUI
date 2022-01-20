//
//  LoginViewModel.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var isLoading = false // for showing Progress View
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    // MARK: - Firebase authentication Signin
    func login(email : String,password : String){
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("MARK : Failed to login \(error.localizedDescription)")
                //If New user
                self.signUp(email: email, password: password)
            }
            self.getUser(Result: result)
            
        }
    }
    
    // MARK: - Firebase authentication Signup
    func signUp(email : String,password : String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("MARK : Failed to login \(error.localizedDescription)")
                return
            }
            self.getUser(Result: result)
            
        }
    }
    
    /**
     * set User Session for user interface and saving uid using Keychain
     */
    func getUser(Result : AuthDataResult?){
        isLoading = false
        if let result = Result {
            userSession = result.user
            let success = Persistence.saveKeyChain(key: Constants.UID, data: result.user.uid.data(using: .utf8)! as NSData)
            print("MARK : Saving UID is \(success)")
            
        }
        
    }
    
    // MARK: - Firebase signout
    func signOut(){
        userSession = nil
        try?  Auth.auth().signOut()
    }
    
}
