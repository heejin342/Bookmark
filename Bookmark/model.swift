//
//  model.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/29.
//

import Foundation
import CoreData
import UIKit

class MyList:NSManagedObject{
    
    @NSManaged var time:Date?
    @NSManaged var word:String?
    
}
