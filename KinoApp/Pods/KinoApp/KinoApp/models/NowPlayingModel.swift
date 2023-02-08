//
//  NowPlayingModel.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 05.02.2023.
//

import Foundation

struct NowPlayingModel {
    let id: Bool
    let description: String
    let title: String
    let posterPath: String
    let genreIds: [Int]
    let releaseDate: String
    let voteAverage: Double
}
