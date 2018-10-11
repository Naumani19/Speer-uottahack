//
//  CameraPopUpViewController.swift
//  uOttawa
//
//  Created by Mathew Mozaffari on 2018-02-18.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit
import Clarifai

class CameraPopUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var importButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    var app:ClarifaiApp?
    let picker = UIImagePickerController()
    
    @IBAction func importImageButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
        {
            //after it is completed
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        /*
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imagePreview.image = image
        }
        else {
            //error message
        }
        self.dismiss(animated: true, completion: nil)
    */
    
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePreview.image = image
            recognizeImage(image: image)
            textView.text = "Recognizing..."
            importButton.isEnabled = false
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        app = ClarifaiApp(apiKey: "cf91fa96127d426fac2e7fcf76aa3532")
    }
    
        
/*
        @IBAction func buttonPressed(_ sender: UIButton) {
            // Show a UIImagePickerController to let the user pick an image from their library.
            picker.allowsEditing = false;
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.delegate = self;
            present(picker, animated: true, completion: nil)
        }
    
    */

        func recognizeImage(image: UIImage) {
            
            // Check that the application was initialized correctly.
            if let app = app {
                
                // Fetch Clarifai's general model.
                app.getModelByName("general-v1.3", completion: { (model, error) in
                    
                    // Create a Clarifai image from a uiimage.
                    let caiImage = ClarifaiImage(image: image)!
                    
                    // Use Clarifai's general model to pedict tags for the given image.
                    model?.predict(on: [caiImage], completion: { (outputs, error) in
                        print("%@", error ?? "no error")
                        guard
                            let caiOuputs = outputs
                            else {
                                print("Predict failed")
                                return
                        }
                        
                        if let caiOutput = caiOuputs.first {
                            // Loop through predicted concepts (tags), and display them on the screen.
                            let tags = NSMutableArray()
                            for concept in caiOutput.concepts {
                                tags.add(concept.conceptName)
                            }
                            
                            DispatchQueue.main.async {
                                // Update the new tags in the UI.
                                self.textView.text = String(format: "Tags:\n%@", tags.componentsJoined(by: ", "))
                            }
                        }
                        
                        DispatchQueue.main.async {
                            // Reset select photo button for multiple selections.
                            self.importButton.isEnabled = true;
                        }
                    })
                })
            }
        }
    }
    

  
    
    
    
    
    
    
    
    


