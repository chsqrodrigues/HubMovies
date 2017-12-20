//
//  MovieDTO.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 18/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import Foundation

class MovieDTO: Codable, Mappable {
    
    var adult : Bool?
    var backdropPath : String?
    var genreIds : [Int]?
    var id : Int?
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var releaseDate : Date?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?

    required public init(){}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieKeys.self)
        voteCount = try values.decode(Int?.self, forKey: .voteCount)
        adult = try values.decode(Bool?.self, forKey: .adult)
        backdropPath = try values.decode(String?.self, forKey: .backdropPath)
        genreIds = try values.decode([Int]?.self, forKey: .genreIds)
        originalLanguage = try values.decode(String?.self, forKey: .originalLanguage)
        originalTitle = try values.decode(String?.self, forKey: .originalTitle)
        overview = try values.decode(String?.self, forKey: .overview)
        popularity = try values.decode(Float?.self, forKey: .popularity)
        posterPath = try values.decode(String?.self, forKey: .posterPath)
        id = try values.decode(Int?.self, forKey: .id)
        title = try values.decode(String?.self, forKey: .title)
        video = try values.decode(Bool?.self, forKey: .video)
        voteAverage = try values.decode(Float?.self, forKey: .voteAverage)
        
        if let dateString = try values.decode(String?.self, forKey: .releaseDate) {
            releaseDate = StringFormatter.stringToDate(dateString)
        }
    }
    
    private enum MovieKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id = "id"
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
    }
}

