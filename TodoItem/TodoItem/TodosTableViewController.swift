//
//  TodosTableViewController.swift
//  TodoItem
//
//  Created by Alex Jintak Han on 2018-10-11.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class TodosTableViewController: UITableViewController {

    var todoList : TodoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        //able to select mutiple
        tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    @IBAction func deleteTodoItems(_ sender: UIBarButtonItem) {
        // check if there are any items selected
        if let selectedRows = tableView.indexPathsForSelectedRows{
            var items = [TodoItem]()
            for indexPath in selectedRows{
                items.append(todoList.todoList(for: [indexPath.row]))
            }
            // remove from model
            todoList.remove(items: items)
            
            // remove from tableview
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()

        }
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{
            if let addItemVC = segue.destination as? AddItemTableViewController{
                addItemVC.delegate = self
            }
        }else if segue.identifier == "EditItemSegue"{
            if let addItemVC = segue.destination as? AddItemTableViewController{
                
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for:cell) {
                    let priority = priorityForSectionIndex(indexPath.section)
                    let item = todoList.todoList(for: priority)[indexPath.row]
                    addItemVC.itemToEdit = item
                    addItemVC.delegate = self

                }
                
            }
        }
        
        
        
    }
    
    private func priorityForSectionIndex(_ index:Int) -> TodoList.Priority? {
        return TodoList.Priority(rawValue: index)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TodoList.Priority.allCases.count
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let priority = priorityForSectionIndex(section){
            return todoList.todoList(for: priority).count
        }
        return 0
    }
    
    // How each cell looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath)
    
            // checkmark, todolabel
        if let priority = priorityForSectionIndex(indexPath.section){
            let items = todoList.todoList(for: priority)
            let item = items[indexPath.row]
            configureCheckmark(for: cell, with: item)
            configureTodoLabel(for: cell, with: item)
        }


            return cell
        
    
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title : String? = nil
        if let priority = priorityForSectionIndex(section){
            switch priority{
            case .high:
                title = "High Priority"
            case .medium:
                title = "medium Priority"
            case .low:
                title = "low Priority"
            }
        }
        return title
    }
    
//    select items
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing{
            return
        }
        // get the cell I selected
        if let cell = tableView.cellForRow(at: indexPath) as? TodoTableViewCell{
//        change the property of the todo Item at from my model
            if let priority = priorityForSectionIndex(indexPath.section){
                let items = todoList.todoList(for: priority)
                let item = items[indexPath.row]
            item.toggleCheckmart()
//            uncheck the check mark from the cell
            configureCheckmark(for: cell, with: item)
            // make it deselected(no hightlighting grey)
            tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        

    }
    
    
    func configureCheckmark(for cell : UITableViewCell, with item : TodoItem) {
        if let cell = cell as? TodoTableViewCell{
        cell.checkMark.text = item.checked ? "✓" : ""
        
        }
    }
    func configureTodoLabel(for cell : UITableViewCell, with item : TodoItem) {
        if let cell = cell as? TodoTableViewCell{
            cell.todoLabel.text = item.text
            
        }
    }
    
    //Able to swipe, delete

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //remove from the model
        if let priority = priorityForSectionIndex(indexPath.section){
            let items = todoList.todoList(for: priority)[indexPath.row]
            todoList.romove(item: item, from: priority, at: indexPath.row)
            //update to tableview
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    // move cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // chagne model
//        todoList.move(item: todoList.todos[sourceIndexPath.row], to: destinationIndexPath.row)
        //update tableview
        tableView.reloadData() // calls detasource methods again
        
    }


}


extension TodosTableViewController: AddItemViewControllerDelegate{
    func addItemDidCancel(){
        navigationController?.popViewController(animated: true)
    }
    func addItemDidFinishAdding(_ item: TodoItem){
        navigationController?.popViewController(animated: true)

        // update model
        todoList.addTodo.(item : item, for: .medium)
        
        // update tabview
        let index = todoList.todoList(for: .medium).count - 1
        let indexPath = IndexPath(row: index, section: TodoList.Priority.medium.rawValue)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    func addItemDidFinishEditing(_ item: TodoItem){
        // what is the index of "item" from todos array
        
        //update model
        for priority in TodoList.Priority.allCases{
            let priorityArray = todoList.todoList(for:priority)
            if let index = priority.index(of: item){
                priorityArray[index] = item
                let indexPath = IndexPath(row:index, section : priority.rawValue)
                if let cell = tableView.cellForRow(at: indexPath){
                    configureTodoLabel(for: cell, with: item)
                }
            }
        }
        if let index = todoList.todos.index(of: item){
            todoList.todos[index] = item
            //update tableview
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = tableView.cellForRow(at: indexPath) {
                configureTodoLabel(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
