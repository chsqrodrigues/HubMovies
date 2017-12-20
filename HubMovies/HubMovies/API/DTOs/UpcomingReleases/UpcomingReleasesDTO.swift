//
//  UpcomingReleasesDTO.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 18/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

class UpcomingReleasesDTO: Codable, Mappable {
    
    var results : [MovieDTO]?
    var page : Int?
    var totalResults : Int?
    var totalPages : Int?
    
    required public init(){}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UpcomingReleasesKeys.self)
        results = try values.decode([MovieDTO]?.self, forKey: .results)
        page = try values.decode(Int?.self, forKey: .page)
        totalResults = try values.decode(Int?.self, forKey: .totalResults)
        totalPages = try values.decode(Int?.self, forKey: .totalPages)
    }
    
    private enum UpcomingReleasesKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

