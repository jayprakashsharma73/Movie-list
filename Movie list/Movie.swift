//
//  Movie.swift
//  Movie list
//
//  Created by Jay Prakash Sharma on 08/04/22.
//


import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case poster = "Poster"
    }
    
}
