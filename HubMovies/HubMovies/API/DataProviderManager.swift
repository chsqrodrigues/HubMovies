//
//  GenericDataProvider.swift
//  BIIS
//
//  Created by Carlos Henrique Siqueira Rodrigues on 25/11/17.
//  Copyright © 2017 Brasil Tecnologia. All rights reserved.
//

import Foundation

@objc protocol GenericDataProvider : class {
    func errorData(message: String)
}

class DataProviderManager<T, S> {
    var dataSourceDelegate: T?
    var model: S?
    
    func getEndpoint(name: String) -> String {
        var dict: NSDictionary = NSDictionary()
        if let path = Bundle.main.path(forResource: "URLs", ofType: "plist") {
            dict = NSDictionary(contentsOfFile: path)!
        }
        let base: String = dict.value(forKey: "BaseUrl") as! String
        let path: String = dict.value(forKey: name) as! String
        
        return base + path
    }
}

