//
//  SecondViewController.swift
//  To Do List
//
//  Created by Abhinav Jayanthy on 12/29/16.
//  Copyright © 2016 Abhinav Jayanthy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    
    @IBAction func addItem(_ sender: Any) {
        
        arrToDoList.append(textField.text!)
        
        // to update array and userdefaults to the same content !!
        
        UserDefaults.standard.set(arrToDoList, forKey: "toDoList")
        textField.text = "" 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

