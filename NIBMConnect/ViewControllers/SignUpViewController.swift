//
//  SignUpViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/18/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
        if tfUserName.text == "" || tfEmail.text == "" || tfPassword.text == "" {
        errorLabel.text = "Please fill all feilds"
        return
        }
        
        if !isValidEmail(testStr: tfEmail.text ?? "") {
            errorLabel.text = "Please enter a valid email"
            return
        }
        
        if tfPassword.text != tfConfirmPassword.text {
            errorLabel.text = "Passwords does not match"
            return
        }
        
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.errorLabel.text = error?.localizedDescription
                return
            }
            
            //user registered successfully update user name
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = strongSelf.tfUserName.text
            changeRequest?.commitChanges { (error) in
                if error != nil {
                    strongSelf.errorLabel.text = error?.localizedDescription
                    return
                }
                
                //user name updated
                strongSelf.userCreated()
                
            }
            
        }
        
        
    }
    
    private func userCreated() {
        performSegue(withIdentifier: "signUpGoToHome", sender: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
}
