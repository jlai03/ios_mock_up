//
//  ViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/22/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var theImage: UIImage!
    
    @IBOutlet weak var myImageview: UIImageView!
    
    @IBAction func Capture(_ sender: Any) {
        let vc = UIImagePickerController()
            vc.allowsEditing = true
            vc.delegate = self
            vc.sourceType = .camera
            
                   
            self.present(vc, animated: true)
            {
                // after it is complete
            }
    }
    
    
    
    @IBAction func usePhoto(_ sender: Any) {
        // pass image to second view controller
        self.theImage = myImageview.image!
        performSegue(withIdentifier: "name", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.theImage != nil {
            let viewController2 = segue.destination as! uploadViewController
                       
            viewController2.theImage2 = self.theImage
        }
        
          
    }
    
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            
            if let image = info[.editedImage] as? UIImage {
                 myImageview.image = image
            }else if let image = info[.originalImage] as? UIImage {
                myImageview.image = image
            }else{
                // Error message
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
    
    
    
      override func viewDidLoad() {
          super.viewDidLoad()
            
        // Circular Frame 
        if myImageview != nil {
        
            // layer
            myImageview.layer.borderWidth = 1.0
            myImageview.layer.masksToBounds = false
            myImageview.layer.borderColor = UIColor.black.cgColor
            myImageview.layer.cornerRadius = myImageview.frame.height/2
            myImageview.clipsToBounds = true
            
        }
        
        
      
        
        
        
      
        
       
        
          // Do any additional setup after loading the view.
      }

        
}




