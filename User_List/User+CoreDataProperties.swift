//
//  User+CoreDataProperties.swift
//  User_List
//
//  Created by Jesus Gonzalez on 26/10/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?

}

extension User : Identifiable {

}
