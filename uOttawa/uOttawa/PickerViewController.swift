//
//  PickerViewController.swift
//  uOttawa
//
//  Created by Mathew Mozaffari on 2018-02-17.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var clinicPickerView: UIPickerView!
    @IBOutlet weak var clinicNameLabel: UILabel!
    
    //delcarations for first responders
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var sexField: UITextField!
    @IBOutlet weak var sinField: UITextField!
    @IBOutlet weak var symptomField: UITextField!
    
    @IBOutlet weak var clinicConfirm: UILabel!
    
    let clinics = ["Downtown Travel Medicine Clinic", "Cloud Clinic", "Ryerson Medical Clinic"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return clinics[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clinics.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        clinicNameLabel.text = clinics[row]
        //clinicConfirm.text = clinicNameLabel.text
    }
    
    @IBAction func changeDetailsTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.symptomField.delegate = self
        // self.firstNameField.delegate = self
        // self.lastNameField.delegate = self
        // self.sexField.delegate = self
        //self.sinField.delegate = self
        
        
        //headerLabel.alpha = 0
        // welcomeLabel.alpha = 0
        
        //popUpView.layer.cornerRadius = 10
        //popUpView.layer.masksToBounds = true
        
    }
    
    /*
     override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     
     UIView.animate(withDuration: 3, animations: {
     self.welcomeLabel.alpha = 0.5
     }) { (true) in
     self.showWelcome()
     }
     
     UIView.animate(withDuration: 3, animations: {
     self.headerLabel.alpha = 0.5
     }) { (true) in
     self.showHeader()
     }
     }
     
     func showWelcome() {
     UIView.animate(withDuration: 1){
     self.welcomeLabel.alpha = 1
     }
     }
     
     func showHeader() {
     UIView.animate(withDuration: 1){
     self.headerLabel.alpha = 1
     }
     } */
    
    
    //hide keyboard when touched outside text
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //user presses return key
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        symptomField.resignFirstResponder()
        return (true)
        sexField.resignFirstResponder()
        return (true)
        sinField.resignFirstResponder()
        return (true)
        firstNameField.resignFirstResponder()
        return (true)
        lastNameField.resignFirstResponder()
        return (true)
    }
    
}

