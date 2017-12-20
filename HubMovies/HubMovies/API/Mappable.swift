//
//  Mappable.swift
//  BIIS
//
//  Created by Carlos Henrique Siqueira Rodrigues on 25/11/17.
//  Copyright © 2017 Brasil Tecnologia. All rights reserved.
//

import Foundation

protocol Mappable: Decodable { }

extension Mappable {
    init?(from json: String) throws {
        guard let data = try json.data(using: .utf8) else { return nil }
        guard let value = try? JSONDecoder().decode(Self.self, from: data) else { return nil }
        self = value
    }
}

extension Encodable {
    func toJSON() -> String? {
        var productJSON:Data?
        do {
            let encoder = JSONEncoder()
            productJSON = try encoder.encode(self)
            return String.init(data: productJSON ?? Data(), encoding: .utf8)
        } catch {
            return nil
        }
    }
}

