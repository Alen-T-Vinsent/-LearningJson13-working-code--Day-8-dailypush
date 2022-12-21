////
////  JSonManager.swift
////  LearningJson13.9
////
////  Created by Apple  on 22/12/22.
////
//
//import Foundation
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Movie
//struct Movie: Codable {
//    let page: Int
//    let results: [Result]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//    
//   static let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
//    static let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&sort_by=popularity.desc")!
//    static let allMovies:[Movie] = Bundle.main.decode(file: "\(url)")
//    static let sampleMovie:Movie = allMovies[0]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage, originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//extension Bundle{
//    func decode<T:Decodable>(file:String)->T{
//        guard let url = self.url(forResource: file, withExtension: nil)else{
//            fatalError("could not find \(file) in the project!")
//        }
//        
//        guard let data = try? Data(contentsOf: url)else{
//            fatalError("Could not load \(file) in the project")
//        }
//        
//        let decoder = JSONDecoder()
//        guard let loadedData = try? decoder.decode(T.self, from: data)else{
//            fatalError("Could not decode \(file) int the project")
//        }
//
//        return loadedData
//        
//    }
//    
//  
//}
