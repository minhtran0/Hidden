//
//  ImageViewController.swift
//  Hidden
//
//  Created by Minh Tran on 9/3/16.
//  Copyright © 2016 Minh. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var text: String?
    
    @IBOutlet weak var imagePicked: UIImageView!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        let url = NSURL(string: "http://i.imgur.com/YhqRo.png")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        imagePicked.image = UIImage(data: data!)
        
        startEncryption()
        
        //presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func startEncryption() {
        if let textToEncrypt = text {
            if let image = imagePicked.image {
                let manager = EncryptionManager(image: image, textToEncrypt: textToEncrypt)
                
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                    let encrypt_result = manager.encrypt()
                    dispatch_async(dispatch_get_main_queue()) {
                        if encrypt_result {
                            // Print out success message
                        }
                        else {
                            // Print out error
                        }
                    }
                }
            }
        }
        
    }
    
    // MARK: - UIImagePickerController
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicked.contentMode = .ScaleAspectFit
        imagePicked.image = image
        startEncryption()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
