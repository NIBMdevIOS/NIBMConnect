//
//  ForgotPasswordViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/18/19.
//  Copyright © 2019 Thilakshi Bandara. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var email: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetPasswordButton.layer.cornerRadius = 8
        
        if email.text != Auth.auth().currentUser?.email {
            dismiss(animated: true)
            return
        }
        
    }
    
    @IBAction func onClickReset(_ sender: Any) {
        
        if email.text == "" {
            alert(message: "Please enter a email")
            return
        }
        
        if email.text != Auth.auth().currentUser?.email {
            alert(message: "Please enter the email this account is associated with")
            return
        }
        
        activityIndicator.startAnimating()
        
        Auth.auth().currentUser?.sendEmailVerification { (error) in
            
            self.activityIndicator.stopAnimating()
            
            if (error == nil){
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            let alertController = UIAlertController(title: "Success", message: "Password reset email sent", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { action in
                self.dismiss(animated: true)
            })
            alertController.addAction(OKAction)
            self.present(alertController, animated: true)
            
            
        }
        
    }
    
    
    @IBAction func closeButtonClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
