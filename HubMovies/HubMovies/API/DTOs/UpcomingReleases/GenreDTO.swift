//
//  GenreDTO.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 19/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

class GenreDTO: Codable, Mappable {
    
    var genres : [ValuesDTO]?
    
    required public init(){}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: GenreKeys.self)
        genres = try values.decode([ValuesDTO]?.self, forKey: .genres)

    }
    
    private enum GenreKeys: String, CodingKey {
        case genres = "genres"
    }
}
