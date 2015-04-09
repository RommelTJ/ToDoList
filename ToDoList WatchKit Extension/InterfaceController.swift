//
//  InterfaceController.swift
//  ToDoList WatchKit Extension
//
//  Created by Rommel Rico on 4/9/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var toDoItems = [String]()
    var defaults = NSUserDefaults(suiteName: "group.com.rommelrico.toDoListAppGroup")
    @IBOutlet weak var table: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        //Get contents of defaults
        if defaults?.objectForKey("toDoList") != nil {
            toDoItems = defaults?.objectForKey("toDoList") as [String]
        }
        
        updateTableData()
    }
    
    func updateTableData() {
        table.setNumberOfRows(toDoItems.count, withRowType: "tableRowController")
        for (index, item) in enumerate(toDoItems) {
            let row = table.rowControllerAtIndex(index) as TableRowController
            row.tableRowLabel.setText(item)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        //User tapped the row. Delete that row.
        toDoItems.removeAtIndex(rowIndex)
        defaults?.setObject(toDoItems, forKey: "toDoList")
        defaults?.synchronize()
        updateTableData()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
