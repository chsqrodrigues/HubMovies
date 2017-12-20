//
//  URLHelper.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 18/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import UIKit

class URLHelper: NSObject {

    //MARK: Get EndPoint
    open class func getEndpoint(_ name: String) -> String {
        var dict: NSDictionary = NSDictionary()
        if let path = Bundle.main.path(forResource: "URLs", ofType: "plist") {
            dict = NSDictionary(contentsOfFile: path)!
        }
        let path: String = dict.value(forKey: name) as! String
        
        return path
    }
}
