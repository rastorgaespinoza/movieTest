//
//  MovieDB.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/24/19.
//  Copyright © 2019 rastorga. All rights reserved.
//
import Moya

enum MovieDB {

    case mostPopular
    case topRated
}

extension MovieDB: TargetType {
    
    //por popular:
    //https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44
    //por top rated:
    //https://api.themoviedb.org/3/movie/top_rated?api_key=34738023d27013e6d1b995443764da44
    //imagen del poster:
    //http://image.tmdb.org/t/p/w500
    ///- Para obtener la imagen/poster de la película, esta es la dirección base http://image.tmdb.org/t/p/w500. Concatene la dirección que aparece en el campo "poster_path" del JSON de la película, de esta forma podrá generar la url completa para obtener la imagen(ej: http://image.tmdb.org/t/p/w500/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg
    static private let apiKey = "34738023d27013e6d1b995443764da44"
    static let baseImagePath = "https://image.tmdb.org/t/p/w500"
    
    // 1
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    // 2
    public var path: String {
        switch self {
        case .mostPopular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        }
    }
    
    // 3
    public var method: Moya.Method {
        return .get
    }
    
    // 4
    public var sampleData: Data {
        return Data()
    }
    
    // 5
    public var task: Task {
        let params = ["api_key": MovieDB.apiKey]
        return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
    }
    
    // 6
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
    
    static func posterUrl(movie: Movie) -> URL? {
        guard let path = movie.poster_path else{ return nil }
        if let url = URL(string: MovieDB.baseImagePath + path) {
            return url
        }
        return nil
    }
}
