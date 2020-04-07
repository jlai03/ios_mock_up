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
    
    @IBAction func upload(_ sender: Any) {
        // TODO: connect this IB action to upload button
        sendImageTimestamp(image: theImage2, filename: "NewImage")
    }
    
    
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
    // Code for sending httpPost request
    func sendImageTimestamp(image: UIImage, filename: String) {
        // 2nd argument ins compression quality [0, 1.0]
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Unable to form JPEG representation")
            return
        }

        let url = URL(string: "http://localhost:3000/camera/sendImage")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.timeoutInterval = 30.0

        let CRLF = "\r\n"
        let formName = "file"
        let type = "image/jpeg"     // file type
        let boundary = String(format: "----iOSURLSessionBoundary.%08x%08x", arc4random(), arc4random())
        var body = Data()

        // file data //
        body.append(("--\(boundary)" + CRLF).data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(formName)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append(("Content-Type: \(type)" + CRLF + CRLF).data(using: .utf8)!)
        body.append(imageData as Data)
        body.append(CRLF.data(using: .utf8)!)

        // footer //
        body.append(("--\(boundary)--" + CRLF).data(using: .utf8)!)
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]

                    if let json = jsonSerialized {
                        print(json)
                        let imageSuccessAlert =  UIAlertController(title: "Image Upload Successful!", message: json["message"] as? String, preferredStyle: .actionSheet)
                        self.present(imageSuccessAlert, animated: true, completion: nil)
                    }
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
