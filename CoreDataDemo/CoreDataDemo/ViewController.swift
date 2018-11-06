//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Alex Jintak Han on 2018-11-06.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 1. refer to persistant container
        // 2. create the NSMagegedObjectContext
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. create an entity(model)
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
    
        // 4. create new record (insert into NSMagegeobjectContext)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        // 5. set attribute values for each key
        newUser.setValue("myUserName", forKey: "username")
        newUser.setValue("1234", forKey: "password")
        newUser.setValue("24", forKey: "age")
        
        
        // 6. save
        do {
            try context.save() // try this ! if there's an error catch block will handle
//            let saved = try? context.save() // this, if error, return nil
//            let saved = try! context.save() // this, if error, error crash

        } catch {
            print("Failed saving...")
        }
        
        // 1. prepare the request of type NSFetchRequest fot the entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
//        request.predicate = NSPredicate(format: "age = %@","21")
        
        // 2. Fetch the result from context in the form of array of [NSManagedObject]
        do{
            let result = try context.fetch(request)
            // 3. Iterate through an array to get value for the specific key
            for user in result as! [NSManagedObject]{
                print(user.value(forKey: "username")as! String)
            }
    
        }catch{
            print("Failed Fetching...")
        }
        
        


    }
    
    


}

