//
//  LoggingViewController.swift
//  uOttawa
//
//  Created by Mathew Mozaffari on 2018-02-17.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class LoggingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
    }
    
    //hide keyboard when touched outside text
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //user presses return key
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        return (true)
        
        emailField.resignFirstResponder()
        return (true)
    }
    
    
    @IBAction func closeSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeSignUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

