//
//  APICaller.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 04.02.2023.
//

import Foundation

protocol APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel])
    func didFailWithError(_ error: Error)
}

struct APICaller {
    
    
    var delegate: APICallerDelegate?
    
    func fetchRequest() {
        for urlString in itemForProject.Values.urlList {
            guard let url = URL(string: urlString) else { fatalError("Incorrect link!")}
            let task = URLSession.shared.dataTask(with: url) {data, _, error in
                if let data, error == nil {
                    if let movieList = parseJSON(data) {
                        delegate?.didUpdateMovieList(with: movieList)
                    } else {
                        delegate?.didFailWithError(error!)
                    }
                } else {
                    delegate?.didFailWithError(error!)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [MovieModel]? {
        var movieList: [MovieModel] = []
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
            for movie in decodedData.results {
                if let backdropPath = movie.backdrop_path {
                    let movieModel = MovieModel(adult: movie.adult, backdropPath: backdropPath, description: movie.overview, id: movie.id, title: movie.title, posterPath: movie.poster_path)
                    movieList.append(movieModel)
                }
            }
        } catch {
            print(error)
            return nil
        }
        return movieList
    }
}

