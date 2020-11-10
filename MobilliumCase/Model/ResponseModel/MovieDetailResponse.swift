import Foundation

struct MovieDetail: Codable {
  
  let adult: Bool?
  let backdropPath: String?
  var backdropUrl: String {
    guard let backdropPath = backdropPath else { return "" }
    return Global.Network.imageBaseUrl + backdropPath
  }
  let budget: Int?
  let homepage: String?
  let id: Int?
  let imdbID, originalLanguage, originalTitle, overview: String?
  let popularity: Double?
  let posterPath: String?
  let releaseDate: String?
  let revenue, runtime: Int?
  let status, tagline, title: String?
  let video: Bool?
  let voteAverage: Double?
  let voteCount: Int?
  let episodeRunTime: [Int]?
  let firstAirDate: String?
  let inProduction: Bool?
  let languages: [String]?
  let lastAirDate: String?
  let name: String?
  let numberOfEpisodes, numberOfSeasons: Int?
  let originCountry: [String]?
  let originalName: String?
  let type: String?
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case budget, homepage, id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case revenue, runtime
    case status, tagline, title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case episodeRunTime = "episode_run_time"
    case firstAirDate = "first_air_date"
    case inProduction = "in_production"
    case languages
    case lastAirDate = "last_air_date"
    case name
    case numberOfEpisodes = "number_of_episodes"
    case numberOfSeasons = "number_of_seasons"
    case originCountry = "origin_country"
    case originalName = "original_name"
    case popularity
    case type
  }
}
