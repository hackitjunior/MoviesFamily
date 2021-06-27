//
//  PersistentContainerRequiring.swift
//  MustC
//
//  Created by Alberto Silva on 26/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//

import Foundation
import CoreData

protocol PersistentContainerRequiring {
    var  persistentContainer: NSPersistentContainer! {get set}
}
