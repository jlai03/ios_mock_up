//
//  loginViewController.swift
//  Mock_Up
//
//  Created by Jonathan Lai on 3/31/20.
//  Copyright © 2020 Silk Lab. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UINavigationControllerDelegate{
    
    // Class texts
      var username: String = ""
      var password: String = ""
    
    // TextFields - Outlets
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    // Login Button
    @IBAction func Login(_ sender: Any) {
        // Assign values to class texts
        self.username = Username.text!
        self.password = Password.text!
        // Segue
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Add code to transfer whatever info you need to attach image to given account
        
        if (self.username != "" && self.password != ""){
            let new_viewController = segue.destination as! ViewController
            // copy over info
            new_viewController.username = self.username
            new_viewController.password = self.password
        }

    }
    
    
    // viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

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
