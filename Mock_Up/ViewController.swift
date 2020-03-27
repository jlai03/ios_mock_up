//
//  ViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/22/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myImageview: UIImageView!
    
    
    @IBAction func Capture(_ sender: Any) {
        let vc = UIImagePickerController()
            vc.delegate = self
            vc.sourceType = .camera
            vc.allowsEditing = true
                   
            self.present(vc, animated: true)
            {
                // after it is complete
            }
    }
    
    
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                myImageview.image = image
                // send to server
    //            let imageData:Data = image.pngData()!
    //            let imageStr = imageData.base64EncodedString()
            }
            else
            {
                // Error message
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
        

        
}




