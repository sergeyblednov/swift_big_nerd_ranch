//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Sergiy Blednov on 10/16/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellInfo = todoList.cellInfo
        tableView.register(cellInfo.cellClass, forCellReuseIdentifier: cellInfo.cellIdentifier)
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text, !text.isEmpty else {
            return
        }
        todoList.addItem(item: text)
        itemTextField.text = ""
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoList.removeItemAtIndex(index: indexPath.row)
        tableView.reloadData()
    }
}

