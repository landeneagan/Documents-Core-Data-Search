//
//  Document+CoreDataProperties.swift
//  Document-Core-Data
//
//  Created by Landen Eagan on 7/13/18.
//  Copyright © 2018 Landen Eagan. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var size: Int32
    @NSManaged public var rawDate: NSDate?

}
