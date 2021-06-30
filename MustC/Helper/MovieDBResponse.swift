//
//  MovieDBResponse.swift
//  MustC
//
//  Created by Alberto Silva on 28/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//

import Foundation

struct MovieDBLookupResponse: Codable {
    struct MovieDBMovie: Codable {
        let popularity: Double?
    }
    
    let results:[MovieDBMovie]
}
