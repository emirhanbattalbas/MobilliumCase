import Foundation

struct Movie: Codable {
  let results: [MovieResult]
  let page, totalResults: Int
  let totalPages: Int
  
  enum CodingKeys: String, CodingKey {
    case results, page
    case totalResults = "total_results"
    case totalPages = "total_pages"
  }
}

struct MovieResult: Codable {
  let voteCount: Int?
  let id: Int
  let voteAverage: Double?
  let title: String?
  let posterPath: String?
  let originalTitle: String?
  let backdropPath: String?
  var backdropUrl: String {
    guard let backdropPath = backdropPath else { return "" }
    return Global.Network.imageBaseUrl + backdropPath
  }
  var posterUrl: String {
    guard let backdropPath = posterPath else { return "" }
    return Global.Network.imageBaseUrl + backdropPath
  }
  let adult: Bool?
  let overview: String?
  let releaseDate: String?
  
  enum CodingKeys: String, CodingKey {
    case voteCount = "vote_count"
    case id
    case voteAverage = "vote_average"
    case title
    case posterPath = "poster_path"
    case originalTitle = "original_title"
    case backdropPath = "backdrop_path"
    case adult, overview
    case releaseDate = "release_date"
  }
}
