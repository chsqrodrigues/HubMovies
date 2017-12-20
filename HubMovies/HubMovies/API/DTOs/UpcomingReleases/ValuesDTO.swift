//
//  ValuesDTO.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 19/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

class ValuesDTO: Codable, Mappable {
    
    var id : Int?
    var name : String?

    required public init(){}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ValuesKeys.self)
        id = try values.decode(Int?.self, forKey: .id)
        name = try values.decode(String?.self, forKey: .name)
    }
    
    private enum ValuesKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

