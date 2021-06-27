//
//  NSPersistentContainer.swift
//  MustC
//
//  Created by Alberto Silva on 26/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//

import CoreData

extension NSPersistentContainer{
    func saveContextIfNeeded(){
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
