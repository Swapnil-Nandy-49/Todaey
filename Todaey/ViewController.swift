//
//  ViewController.swift
//  Todaey
//
//  Created by Swapnil Nandy on 20/4/20.
//  Copyright © 2020 Swapnil Nandy. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
  
    var ArrayList = ["Ankit", "Sujit", "Mithun", "Rajak"]
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [String]{
            ArrayList = items
        }
    }

     // MARK - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = ArrayList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayList.count
    }

    // Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(ArrayList[indexPath.row])
        
        // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark  // To checkmark the item we select
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)          // to flash grey the highlighter and disappear soon
        }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todaey List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once user clicks on the UI Alert button
            print("Sucess")
            //print(textFiled.text)
            self.ArrayList.append(textFiled.text!)
            self.defaults.set(self.ArrayList, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Crete new item"
         textFiled = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

