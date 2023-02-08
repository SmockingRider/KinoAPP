//
//  NowPlayingData.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 05.02.2023.
//

import Foundation

struct NowPlayingData: Decodable {
    let results: [Results]
}

struct Results : Decodable {
    let id: Bool
    let overview: String
    let title: String
    let poster_path: String
    let genre_ids: [Int]
    let release_date: String
    let vote_average: Double
}
