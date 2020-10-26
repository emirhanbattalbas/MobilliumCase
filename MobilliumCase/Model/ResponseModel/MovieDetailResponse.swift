import Foundation

struct MovieDetail: Codable {
  
  let adult: Bool?
  let backdropPath: String?
  var backdropUrl: String {
    guard let backdropPath = backdropPath else { return "" }
    return Constant.Network.imageBaseUrl + backdropPath
  }
  let budget: Int?
  let genres: [Genre]?
  let homepage: String?
  let id: Int?
  let imdbID, originalLanguage, originalTitle, overview: String?
  let popularity: Double?
  let posterPath: String?
  let releaseDate: String?
  let revenue, runtime: Int?
  let spokenLanguages: [SpokenLanguage]?
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
    case budget, genres, homepage, id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case revenue, runtime
    case spokenLanguages = "spoken_languages"
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

struct Genre: Codable {
  let id: Int
  let name: String
}

struct ProductionCompany: Codable {
  let id: Int
  let logoPath: String?
  let name, originCountry: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case logoPath = "logo_path"
    case name
    case originCountry = "origin_country"
  }
}

struct ProductionCountry: Codable {
  let iso3166_1, name: String
  
  enum CodingKeys: String, CodingKey {
    case iso3166_1 = "iso_3166_1"
    case name
  }
}

struct SpokenLanguage: Codable {
  let iso639_1, name: String
  
  enum CodingKeys: String, CodingKey {
    case iso639_1 = "iso_639_1"
    case name
  }
}

