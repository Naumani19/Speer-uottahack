//
//  TimeViewController.swift
//  uOttawa
//
//  Created by Mathew Mozaffari on 2018-02-18.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var apLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide keyboard when touched outside text
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //user presses return key
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        timeLabel.resignFirstResponder()
        return (true)
        
        apLabel.resignFirstResponder()
        return (true)
    }
    
    
}

