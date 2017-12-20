//
//  BIISServiceRequest.swift
//  BIIS
//
//  Created by Carlos Henrique Siqueira Rodrigues on 25/11/17.
//  Copyright © 2017 Brasil Tecnologia. All rights reserved.
//

import UIKit
import Alamofire

class ServiceRequest: NSObject {
    
    // MARK: - Request return String
    open class func request(_ strURL: String,
                            method: HTTPMethod,
                            params: String?,
                            headers: [String: String]?,
                            queries: [String: String]?,
                            success: @escaping (String) -> Void,
                            failure: @escaping (String) -> Void){
        
        let oauthHandler = ManagerAccessToken()
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.adapter = oauthHandler
        sessionManager.retrier = oauthHandler
        
        var parameters: [String: Any]?
        
        if let data = params?.data(using: .utf8) {
            do {
                parameters = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        
        var items = queries == nil ? [String: String]() : queries
        items?.updateValue(URLHelper.getEndpoint("apiKey"), forKey: "api_key")
        
        var url = String()
        
        if let query = items?.queryString {
            url = strURL + "?\(query)"
        }
        sessionManager.request(url,
                               method: method,
                               parameters: parameters,
                               encoding: JSONEncoding.default,
                               headers: headers).validate().responseString {(response) -> Void in
                                if response.result.isSuccess {
                                    
                                    
                                    success(response.result.value!)
                                    
                                    
                                } else
                                    if response.result.isFailure {
                                        failure(R.string.localizable.errorServiceGeneric())
                                }
        }
    }
}

