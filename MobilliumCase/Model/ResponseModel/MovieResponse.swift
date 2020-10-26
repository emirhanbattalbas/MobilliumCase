import Foundation

struct Dates: Codable {
  let maximum, minimum: String
}

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
  let voteCount, id: Int
  let video: Bool
  let voteAverage: Double
  let title: String
  let popularity: Double
  let posterPath: String
  let originalTitle: String
  let genreIDS: [Int]
  let backdropPath: String
  var backdropUrl: String {
    return Constant.Network.imageBaseUrl + backdropPath
  }
  let adult: Bool
  let overview, releaseDate: String
  
  enum CodingKeys: String, CodingKey {
    case voteCount = "vote_count"
    case id, video
    case voteAverage = "vote_average"
    case title, popularity
    case posterPath = "poster_path"
    case originalTitle = "original_title"
    case genreIDS = "genre_ids"
    case backdropPath = "backdrop_path"
    case adult, overview
    case releaseDate = "release_date"
  }
}
