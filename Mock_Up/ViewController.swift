//
//  ViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/22/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // Class Image
    var theImage: UIImage!
    
    // Class Login info
    var username: String!
    var password: String!
    
    // Username Display
    @IBOutlet weak var U_Display: UILabel!
    
    
    // ImageView - Outlet
    @IBOutlet weak var myImageview: UIImageView!
    
    // Capture Button
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
    
    
    // Use Photo Button
    @IBAction func usePhoto(_ sender: Any) {
        // pass image to second view controller
        if(myImageview.image != nil){
            self.theImage = myImageview.image!
        }
        performSegue(withIdentifier: "UsePhoto", sender: self)
    }
    
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create second instance
         let viewController2 = segue.destination as! uploadViewController
        // Image
        if self.theImage != nil {
            viewController2.theImage2 = self.theImage
        }
        if(self.username != "" && self.password != ""){
            viewController2.username = self.username
            viewController2.password = self.password
        }
    }
    
    
    // Image Picker Controller
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
        
    
    
    // View Did Load
    override func viewDidLoad() {
          super.viewDidLoad()
        // User ID Display
        if (username != nil){
            U_Display.text = self.username!
        }else{
            U_Display.text = ""
        }

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




