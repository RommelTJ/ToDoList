//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Rommel Rico on 2/26/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(itemTextField.text)
        itemTextField.text = ""
        defaults?.setObject(toDoList, forKey: "toDoList")
        defaults?.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemTextField.resignFirstResponder()
        return true
    }


}

