import Alamofire

class ApiRouter {
  typealias CompletionHandler<T> = (_ error: RestError?, _ response: T?) -> Void
  
  public static func doRequest<T: Decodable>(request: UrlRequest,
                                             decodingType: T.Type,
                                             completionHandler: @escaping CompletionHandler<T>) {
    AF.request(request.url,
               method: request.method,
               parameters: request.parameters,
               encoding: request.encoding,
               headers: request.headers)
      
      .responseData { (response) in
        switch response.result {
        case .success(let value):
      
          do {
            let instance = try JSONDecoder().decode(decodingType, from: value)
            completionHandler(nil, instance)
          } catch let error {
            completionHandler(RestError.logicError(error: error), nil)
          }
          
        case .failure(let error):
          completionHandler(RestError.logicError(error: error), nil)
        }
      }
  }
}
