//
//  Document+CoreDataClass.swift
//  Document-Core-Data
//
//  Created by Landen Eagan on 7/13/18.
//  Copyright © 2018 Landen Eagan. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(title: String?, text: String?, size: Int32, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Document.entity(), insertInto: managedContext)
        
        self.title = title
        self.text = text
        self.size = size
        self.date = date
    }
}
