//
//  ViewController.swift
//  MAS_Assignment_1
//
//  Created by Aaron Wasserman on 8/31/18.
//  Copyright © 2018 CS4261. All rights reserved.
//

import UIKit
import AWSCore
import AWSDynamoDB

class ViewController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitPress(_ sender: Any) {
    }
    
}

