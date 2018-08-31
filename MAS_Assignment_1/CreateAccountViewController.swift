//
//  CreateAccountViewController.swift
//  MAS_Assignment_1
//
//  Created by Aaron Wasserman on 8/31/18.
//  Copyright © 2018 CS4261. All rights reserved.
//

import UIKit
import AWSCore
import AWSDynamoDB

class CreateAccountViewController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    
    @IBOutlet var passwordText: UITextField!
    
    var dynamoDB: AWSDynamoDB?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamoDB = AWSDynamoDB.default()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitPress(_ sender: Any) {
        
        let newAccount = AWSDynamoDBPutItemInput()
        newAccount?.tableName = "MAS_Assignment_1"
        let hashValue = AWSDynamoDBAttributeValue()
        hashValue?.s = usernameText.text
        let passwordValue = AWSDynamoDBAttributeValue()
        passwordValue?.s = passwordText.text
        
        newAccount?.item = [
            "username" : hashValue,
            "password" : passwordValue
        ] as! [String : AWSDynamoDBAttributeValue]
        
        
        dynamoDB?.putItem(newAccount!).continueWith { (task: AWSTask) -> AnyObject? in
            
            if (task.error != nil) {
                
                print(task.error)
                
            }
            
            if (task.result != nil) {
                
                
                print(task.result)
                
            

                
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Account Created", message: "Account created now please go log in.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: "Cancel"), style: .`default`, handler: { _ in
                        NSLog("The \"Cancel\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)

                    
                }
                
                
            }
            
            return nil
        }
        
    }
    

}
