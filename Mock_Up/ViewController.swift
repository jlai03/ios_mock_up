//
//  ViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/22/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
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
            
        // ATTEMPT 1
//        // Trying to get circular frame
//        if myImageview != nil {
//            myImageview.layer.cornerRadius = myImageview.frame.size.width/2
//            myImageview.clipsToBounds = true
//        }
               
        
        // ATTEMPT 2
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




