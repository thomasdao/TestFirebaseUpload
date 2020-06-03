//
//  ViewController.swift
//  TestUpload
//
//  Created by thomasdao on 6/3/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        guard let fileUrl = Bundle.main.url(forResource: "puppy", withExtension: "jpg") else {
            return
        }
        uploadFile(fileUrl)
    }
    
    @IBAction func uploadNumbers(_ sender: Any) {
        guard let fileUrl = Bundle.main.url(forResource: "Home Improvement", withExtension: "numbers") else {
            return
        }
        uploadFile(fileUrl)
    }
    
    func uploadFile(_ fileUrl: URL) {
        if !FileManager.default.fileExists(atPath: fileUrl.path) {
            return
        }
        
        let fileId = "\(UUID().uuidString)"
        let imageRef = Storage.storage().reference(withPath: "test/\(fileId)")
        statusLabel.text = "Uploading..."
        imageRef.putFile(from: fileUrl, metadata: nil) { (_, error) in
            if let err = error {
                self.statusLabel.text = err.localizedDescription
            } else {
                self.statusLabel.text = "Success"
            }
        }
    }
}

