//
//  SignInViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/18/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var tpEmail: UITextField!
    @IBOutlet weak var tpPassword: UITextField!
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set button corner radius
        buttonLogIn.layer.cornerRadius = 8
        
        
        
    }
    
    
    @IBAction func signInAction(_ sender: Any) {
        
        if tpEmail.text == "" || tpPassword.text == "" {
            errorLabel.text = "Please fill all fields"
            return
        }
        
        if !isValidEmail(testStr: tpEmail.text!) {
            errorLabel.text = "Enter a valid email"
            return
        }
        
        Auth.auth().signIn(withEmail: tpEmail.text!, password: tpPassword.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error != nil){
                strongSelf.errorLabel.text = error?.localizedDescription
                return
            }
            
            //sign in successfull redirect to home page
            strongSelf.performSegue(withIdentifier: "goToHomeSqgue", sender: nil)
            
        }
    }

    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordSqgue", sender: nil)
    }
    
    
    @IBAction func googleSignInAction(_ sender: Any) {
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}
