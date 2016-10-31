//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Sergiy Blednov on 10/16/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    let fileURL: NSURL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todoList.items") as NSURL
    }()
    
    var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        print("Saving items to \(fileURL)")
        if !itemsArray.write(to: fileURL as URL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL as URL) as? [String] {
            items = itemsArray
        }
    }
    
    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
    
    func removeItemAtIndex(index: Int) {
        items.remove(at: index)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    var cellInfo: (cellClass: AnyClass, cellIdentifier: String) {
        return (UITableViewCell.self, "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
}
