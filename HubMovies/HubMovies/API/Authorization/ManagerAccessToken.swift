//
//  ManagerAccessToken.swift
//  BIIS
//
//  Created by Carlos Henrique Siqueira Rodrigues on 25/11/17.
//  Copyright © 2017 Brasil Tecnologia. All rights reserved.
//

import Foundation
import Alamofire

public class ManagerAccessToken: RequestAdapter, RequestRetrier {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
    
    public init () {}
    
    private let lock = NSLock()
    private var accessToken: String?
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    
    // MARK: - RequestAdapter
    
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if let access_token = accessToken {
            urlRequest.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        }
        urlRequest.timeoutInterval = 10.0
        return urlRequest
    }
    
    // MARK: - RequestRetrier
    
    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)
            
            getToken { (_) in
                
            }
            
        } else {
            completion(false, 0.0)
        }
    }
    
    // MARK: - Private - Refresh Tokens
    private func getToken(completion: @escaping (Bool) -> Void) {
        if !isRefreshing {
            refreshTokens { [weak self] succeeded, accessToken in
                guard let strongSelf = self else { return }
                
                strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }
                
                if let accessToken = accessToken {
                    strongSelf.accessToken = accessToken
                }
                
                strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                strongSelf.requestsToRetry.removeAll()
                
                completion(true)
            }
        }
        
    }
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        let urlString = URLHelper.getEndpoint("BaseUrl") + URLHelper.getEndpoint("getTokenEndPoint")
        
        let parameters = ["api_key": URLHelper.getEndpoint("apiKey")]
        
        sessionManager.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
            .responseJSON { [weak self] response in
                guard let strongSelf = self else { return }
                
                if
                    let json = response.result.value as? [String: Any],
                    let accessToken = json["request_token"] as? String
                {
                    completion(true, accessToken)
                } else {
                    completion(false, nil)
                }
                
                strongSelf.isRefreshing = false
        }
    }
}

