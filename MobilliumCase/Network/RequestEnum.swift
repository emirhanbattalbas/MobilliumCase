import Alamofire

enum RequestEnum: UrlRequest {
  
  private static let baseUrl = Global.Network.baseUrl

  case nowPlaying(parameters: CommonParameters)
  case upComing(parameters: CommonParameters)
  case movieDetail(id: Int, parameters: CommonParameters)
  case similarMovie(id: Int, parameters: CommonParameters)
  case movieSearch(parameters: CommonParameters)
  
  var url: URL {
    var relativeUrl = RequestEnum.baseUrl
    switch self {
    case .nowPlaying:
      relativeUrl += "/3/movie/now_playing"
    case .upComing:
      relativeUrl += "/3/movie/upcoming"
    case let .movieDetail(id, _):
      relativeUrl += "/3/movie/\(id)"
    case let .similarMovie(id, _):
      relativeUrl += "/3/movie/\(id)/similar"
    case .movieSearch:
      relativeUrl += "/3/search/movie"
      
    }
    
    return URL(string: relativeUrl)!
  }
  
  var method: HTTPMethod {
    switch self {
    case .nowPlaying, .upComing, .movieDetail, .similarMovie, .movieSearch:
      return .get
    }
  }
  
  var parameters: Parameters? {
    switch self {
    case let .nowPlaying(parameters):
      return parameters.convertToJson
    case let .upComing(parameters):
      return parameters.convertToJson
    case let .movieDetail(_,parameters):
      return parameters.convertToJson
    case let .similarMovie(_, parameters):
      return parameters.convertToJson
    case let .movieSearch(parameters):
      return parameters.convertToJson
    }
  }
  
  var encoding: ParameterEncoding {
    switch self {
    case .nowPlaying, .upComing, .movieDetail, .similarMovie, .movieSearch:
      return URLEncoding.default
    }
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
}

