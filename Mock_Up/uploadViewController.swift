//
//  uploadViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/30/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class uploadViewController: UIViewController {

    // Class Login info
    var username: String!
    var password: String!
    
    // Class Image
    var theImage2: UIImage!
    
    // Image View 2 - Outlet
    @IBOutlet weak var myImageview2: UIImageView!
    
    // Retake Button
    @IBAction func Retake(_ sender: Any) {
        performSegue(withIdentifier: "Retake", sender: self)
    }
    
    // Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create Second INstance
        let viewController2 = segue.destination as! ViewController
         // Username and Password
        if(self.username != "" && self.password != ""){
            viewController2.username = self.username
            viewController2.password = self.password
        }
    }
        
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign image
        myImageview2.image = theImage2
        
        // circular frame
        if myImageview2 != nil {
            
            // layer
            myImageview2.layer.borderWidth = 1.0
            myImageview2.layer.masksToBounds = false
            myImageview2.layer.borderColor = UIColor.black.cgColor
            myImageview2.layer.cornerRadius = myImageview2.frame.height/2
            myImageview2.clipsToBounds = true
          }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
