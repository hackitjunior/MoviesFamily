//
//  Movie+CoreDataProperties.swift
//  MustC
//
//  Created by Alberto Silva on 27/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var familyMember: FamilyMember?

}
