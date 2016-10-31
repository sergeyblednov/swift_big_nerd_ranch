//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Sergiy Blednov on 10/22/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var contactImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImageView.image = DefaultImage.generate(of: contactImageView.frame.size);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
