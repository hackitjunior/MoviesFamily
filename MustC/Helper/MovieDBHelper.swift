//
//  MovieDBHelper.swift
//  MustC
//
//  Created by Alberto Silva on 28/06/21.
//  Copyright © 2021 DonnyWals. All rights reserved.
//

import Foundation

struct MovieDBHelper {
    typealias MovieDBCallback = (Double?) -> Void
    let apiKey = secretCredentials.movieAPIKey
    
    func fetchRating(forMovie movie: String, callback: @escaping MovieDBCallback){
        guard let searchUrl = url(forMovie: movie) else {
            callback(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: searchUrl){
            (data, response, error) in
            var rating: Double? = nil
            defer {
                callback(rating)
            }
            
            let decoder = JSONDecoder()
            guard error == nil,
                  let data = data,
                  let lookupResponse = try? decoder.decode(MovieDBLookupResponse.self, from: data),
                  let popularity = lookupResponse.results.first?.popularity
            else { return }
            rating = popularity
        }
        task.resume()
    }
    
    private func url(forMovie movie: String) -> URL? {
        guard let query = movie.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil }
        
        var urlString = "https://api.themoviedb.org/3/search/movie/"
        urlString = urlString.appending("?api_key=\(apiKey)")
        urlString = urlString.appending("&query=\(query)")
        return URL(string: urlString)
    }
}
