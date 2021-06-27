//
//  NSManagedObjectContext.swift
//  MustC
//
//  Created by Alberto Silva on 27/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func persist(block: @escaping() -> Void){
        perform {
            block()
            do {
                try self.save()
            } catch {
                self.rollback()
            }
        }
    }
}
