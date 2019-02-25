//
//  Movie.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/24/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit

class Movie: Codable  {
    
    var vote_count: Int = 0 //": 1985,
    var id: Int = 0 //": 19404,
//    var video: Bool //": false,
    var vote_average: Double = 0.0 //": 9.1,
    var title: String = "" //": "Dilwale Dulhania Le Jayenge",
//    var popularity: String //": 17.131,
    var poster_path: String? //": "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
//    var original_language: String //": "hi",
//    var original_title: String //": "दिलवाले दुल्हनिया ले जायेंगे",
//    var genre_ids: [Int] //": [35,18,10749],
//    var backdrop_path: String? //"/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
//    var adult: Bool //": false,
    var overview: String = "" //": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
    var release_date: String = "" //": "1995-10-20"
    
//    var image: UIImage? = nil
    
}
