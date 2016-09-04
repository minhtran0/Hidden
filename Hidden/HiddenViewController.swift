//
//  HiddenViewController.swift
//  Hidden
//
//  Created by Minh Tran on 9/2/16.
//  Copyright © 2016 Minh. All rights reserved.
//

import UIKit

class HiddenViewController: UIViewController {

    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var textfield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let vc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                if identifier == "HideContinue" {
                    vc.text = textfield.text!;
                }
            }
        }
    }
}
