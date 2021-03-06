//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Rommel Rico on 2/26/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import UIKit

var toDoList = [String]()

var defaults = NSUserDefaults(suiteName: "group.com.rommelrico.toDoListAppGroup")

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ((defaults?.objectForKey("toDoList")) != nil) {
            toDoList = defaults?.objectForKey("toDoList") as [String]
        }
 
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoList.removeAtIndex(indexPath.row)
            defaults?.setObject(toDoList, forKey: "toDoList")
            defaults?.synchronize()
            toDoListTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }

}

