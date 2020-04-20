//
//  statsViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 4/19/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class statsViewController: UIViewController {
    
    // Login Info
    var username: String!
    var password: String!
    // Image Info
    var theImage: UIImage!
    var Graph: UIImage!
    // Measurement Info
    var pH_val: Int!
    var L_val: Int!
    var T_val: Int!
    var A_val: Int!
    
    
    // Original Image
    @IBOutlet weak var myImageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // assign image
        myImageview.image = theImage
        // circular frame
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
