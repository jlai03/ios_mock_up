//
//  uploadViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/30/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class uploadViewController: UIViewController {

  var theImage2: UIImage!
    

    @IBOutlet weak var myImageview2: UIImageView!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

            myImageview2.image = theImage2
        
            
    // ATTEMPT 2
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
