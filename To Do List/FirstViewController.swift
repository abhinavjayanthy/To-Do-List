//
//  FirstViewController.swift
//  To Do List
//
//  Created by Abhinav Jayanthy on 12/29/16.
//  Copyright © 2016 Abhinav Jayanthy. All rights reserved.
//

import UIKit
// to make it avai to other view controller 

var arrToDoList = [String]()

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet var toDoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            
            
            // will check if to do list exits, if it dosent it means that user has not entered anything in the arry **** if condition very important here ****
            
            arrToDoList = UserDefaults.standard.object(forKey: "toDoList")  as! [String]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        toDoListTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return arrToDoList.count;
        
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{ //This defines contents of each indvidual cell
        
        let eachcell = tableView.dequeueReusableCell(withIdentifier: "eachcell", for: indexPath)
        eachcell.textLabel?.text = arrToDoList[indexPath.row]
        return eachcell
    }
   
// called when editing an item in a table
   public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
    if (editingStyle == UITableViewCellEditingStyle.delete){
        
        arrToDoList.remove(at: indexPath.row)
        
        UserDefaults.standard.set(arrToDoList, forKey: "toDoList")
        
        toDoListTable.reloadData()
    }
    }

}
