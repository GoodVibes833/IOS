//
//  Page+CoreDataProperties.swift
//  AVStoryBookAssignment
//
//  Created by Alex Jintak Han on 2018-11-07.
//  Copyright © 2018 AlexHan. All rights reserved.
//
//

import Foundation
import CoreData


extension Page {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Page> {
        return NSFetchRequest<Page>(entityName: "Page")
    }

    @NSManaged public var audio: NSData?
    @NSManaged public var image: NSData?

}
