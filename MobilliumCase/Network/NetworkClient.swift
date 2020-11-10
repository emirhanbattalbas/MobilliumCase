import Alamofire

class NetworkClient {
  
  static func nowPlaying(completionHanler: @escaping ApiRouter.CompletionHandler<Movie>) {
    let request = RequestEnum.nowPlaying(parameters: CommonParameters(page: 1))
    ApiRouter.doRequest(request: request,
                        decodingType: Movie.self,
                        completionHandler: completionHanler)
  }
  
  static func upComing(completionHanler: @escaping ApiRouter.CompletionHandler<Movie>) {
    let request = RequestEnum.upComing(parameters: CommonParameters(page: 1))
    ApiRouter.doRequest(request: request,
                        decodingType: Movie.self,
                        completionHandler: completionHanler)
  }
  
  static func movieDetail(id: Int, completion: @escaping ApiRouter.CompletionHandler<MovieDetail>) {
    let request = RequestEnum.movieDetail(id: id, parameters: CommonParameters())
    ApiRouter.doRequest(request: request,
                        decodingType: MovieDetail.self,
                        completionHandler: completion)
  }
  
  static func similarMovie(id: Int, completion: @escaping ApiRouter.CompletionHandler<Movie>) {
    let request = RequestEnum.similarMovie(id: id, parameters: CommonParameters(page: 1))
    ApiRouter.doRequest(request: request,
                        decodingType: Movie.self,
                        completionHandler: completion)
  }
  
  static func movieSearch(text: String, completion: @escaping ApiRouter.CompletionHandler<Movie>) {
    let request = RequestEnum.movieSearch(parameters: CommonParameters(page: 1, query: text))
    ApiRouter.doRequest(request: request,
                        decodingType: Movie.self,
                        completionHandler: completion)
  }
}
