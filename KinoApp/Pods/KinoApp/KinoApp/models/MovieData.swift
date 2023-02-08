//
//  MovieData.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 04.02.2023.
//

import Foundation

struct MovieData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let adult: Bool
    let overview: String
    let backdrop_path: String?
    let id: Int
    let title: String
    let poster_path: String
}


