//
//  Extension+ Dictionary.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 17/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.characters.dropLast())
        return output
    }
}
