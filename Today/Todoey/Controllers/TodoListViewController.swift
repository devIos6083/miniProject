//
//  TodoListViewController.swift
//  Todoey
//
//  Created by 홍규강 on 8/28/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit
import CoreData
/*
 itemArray을 이용해 / selectedCategory / context를 이용해서 coreData와 상호작용해
 */
class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 앱이 시작될 때 Core Data에 저장된 데이터를 로드하도록 수정
         loadItems() // Core Data에서 저장된 데이터를 불러오는 메서드
    }
    
    //MARK: - TableView source
    /*
     tableview 갯수는 numberOfRowsInSection / cell은 ToDoItemCell을 기준으로 item에서 가져와서 cell은 각각 title 이고 accessoryType은 bool 값에 따라 체크마크와 없는 것을 변경해줌
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    //MARK: - TableView Delegate Methods
    /*
     만약 선택이 되었다면 -> itemArray를 저장해줘 -> tableview 선택
     */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Data Manipulation Methods
    
    /*
     context를 저장하거나 print("Error saving category \(error)")
     request를 이용해서 category와 관련된 데이터를 붙혀봐 / do try context.fetch(request) catch  print("Error loading categories \(error)")
     */
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        // Core Data에 저장된 데이터를 로드하는 과정이 명확하게 추가됨
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)

        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }

        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }

    func saveItems() {
        do {
            // Core Data의 context를 저장하여 데이터베이스에 반영
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }

        tableView.reloadData() // 저장 후 테이블 뷰 갱신
    }

    
    //MARK: - Add New Items
    /*
     textField -> UIAlertController "Add New Todoey Item"로 경고를 줘 /
     action으로 경고를 이용해서 할 것들을 정리해줘 "Add Item" /
     newItem은 Item에서 가져와 > title / 초기 done / parent / itemArray에 추가해
     alert textfield에 초기는 "Create new item" -> textfield에 기입해줘
     
     */
   
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            newItem.parentCategory = self.selectedCategory
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    

   
}

//MARK: - Search bar methods

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        let request : NSFetchRequest<Item> = Item.fetchRequest()
    
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItems(with: request, predicate: predicate)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
          
        }
    }
}
