//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/18/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import LocalAuthentication
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func myFriendsAAction(_ sender: Any) {
        performSegue(withIdentifier: "homeToFriends", sender: nil)
    }
    
    @IBAction func homeworkAction(_ sender: Any) {
        performSegue(withIdentifier: "homeToHomework", sender: nil)
    }
    
    @IBAction func profileaction(_ sender: Any) {
        authenticationFingerPrint()
    }
    
    
    //Authentication fingerprint function
    func authenticationFingerPrint(){
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                
                if error != nil{
                    DispatchQueue.main.async {
                    self.alert(message: "Authentication Failed")
                    }
                    return
                }
                
                
                if success{
                    //Go to My Account Page
                    DispatchQueue.main.async {
                       self.performSegue(withIdentifier: "homeToProfile", sender: nil)
                    }
                } 
              
                
            })
            
        }
        else{
           self.alert(message: "Authentication Failed")
        }
    }
    
    
    @IBAction func logOutClick(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "logOutSegue", sender: nil)
    }
    
}
