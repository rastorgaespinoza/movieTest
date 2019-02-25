//
//  CodableResponses.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/24/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import Foundation

struct MovieDBResponse<T: Codable>: Codable {
    let results: [T]
}
