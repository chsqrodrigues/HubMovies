//
//  UpcomingReleasesDataProvider.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 18/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

class UpcomingReleasesDataProvider: DataProviderManager<UpcomingReleasesDataProviderProtocol, Any> {
    
    func requestUpcomingReleases(page: Int) {
        let query = ["page" : String(page), "language": "pt-br"]
        let url = self.getEndpoint(name: "getUpcomingEndPoint")
        
        ServiceRequest.request(url, method: .get, params: nil, headers: nil, queries: query, success: { (response) in
            if let element = try? UpcomingReleasesDTO(from: response), let obj = element {
                self.dataSourceDelegate?.responseUpcomingReleases(obj)
            }
        }) { (error) in
            self.dataSourceDelegate?.errorData(message: error)
        }
    }
    
    func requestSearchMovies(_ page: Int, search: String) {
        var searchText = String()
        
        if let encodeSearch = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            searchText = encodeSearch
        }
        
        let query = ["page" : String(page), "query" : searchText, "language": "pt-br"]
        let url = self.getEndpoint(name: "searchMovieEndPoint")
        
        ServiceRequest.request(url, method: .get, params: nil, headers: nil, queries: query, success: { (response) in
            if let element = try? UpcomingReleasesDTO(from: response), let obj = element {
                self.dataSourceDelegate?.responseUpcomingReleases(obj)
            }
        }) { (error) in
            self.dataSourceDelegate?.errorData(message: error)
        }
    }
    
    func requestGenres() {
        let query = ["language": "pt-br"]
        let url = self.getEndpoint(name: "listGenresEndPoint")
        
        ServiceRequest.request(url, method: .get, params: nil, headers: nil, queries: query, success: { (response) in
            if let element = try? GenreDTO(from: response), let obj = element {
                self.dataSourceDelegate?.responseGenres(obj)
            }
        }) { (error) in
            self.dataSourceDelegate?.errorData(message: error)
        }
    }
}

protocol UpcomingReleasesDataProviderProtocol: GenericDataProvider {
    func responseUpcomingReleases(_ response: UpcomingReleasesDTO)
    func responseGenres(_ response: GenreDTO)
}
