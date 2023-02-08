//
//  MovieModel.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 04.02.2023.
//

import Foundation

struct MovieModel {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let description: String
    let posterPath: String
    let genreIds: [Int]
    let releaseDate: String
    let voteAverage: Double
}

