//
//  ViewController.swift
//  uOttawa
//
//  Created by Mathew Mozaffari on 2018-02-17.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var speerLogo: UIImageView!
    @IBOutlet weak var beginLabel: UIButton!
    @IBOutlet weak var anywhereLabel: UILabel!
    @IBOutlet weak var anytimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func showPopup(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speerLogo.alpha = 0
        beginLabel.alpha = 0
        anywhereLabel.alpha = 0
        anytimeLabel.alpha = 0
        speedLabel.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.speerLogo.alpha = 0.5
            self.speedLabel.alpha = 0.5
        }) { (true) in
            self.showLogoWithText()
        }
        
        UIView.animate(withDuration: 4, animations: {
            self.anytimeLabel.alpha = 0.5
        }) { (true) in
            self.showAnytime()
        }
        
        UIView.animate(withDuration: 5, animations: {
            self.anywhereLabel.alpha = 0.5
        }) { (true) in
            self.showAnywhere()
        }
        
        UIView.animate(withDuration: 3, animations: {
            self.beginLabel.alpha = 0.5
        }) { (true) in
            self.showBegin()
        }
        
    }
    
    func showBegin() {
        UIView.animate(withDuration: 1){
            self.beginLabel.alpha = 1
        }
    }
    
    func showAnytime() {
        UIView.animate(withDuration: 1){
            self.anytimeLabel.alpha = 1
        }
    }
    
    func showAnywhere() {
        UIView.animate(withDuration: 1){
            self.anywhereLabel.alpha = 1
        }
    }
    
    
    func showLogoWithText() {
        UIView.animate(withDuration: 1){
            self.speerLogo.alpha = 1
            self.speedLabel.alpha = 1
        }
    }
    
    func showFullImages() {
        UIView.animate(withDuration: 1) {
            self.speerLogo.alpha = 1
            self.beginLabel.alpha = 1
            self.anywhereLabel.alpha = 1
            self.anytimeLabel.alpha = 1
            self.speedLabel.alpha = 1
        }
    }
    
}
