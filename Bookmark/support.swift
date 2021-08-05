//
//  support.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/29.
//

import Foundation
import CoreData
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext

func saveContext(){

    if context.hasChanges
    {
        do{
            try context.save()
        }catch{
            print(error)
        }
        
    }
}

class PersistenceManager {
    
    static var shared: PersistenceManager = PersistenceManager()
    
    @discardableResult func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
            do {
                try context.execute(delete)
            return true
                
            } catch {
                return false
                
            }
        
    }
    
}



