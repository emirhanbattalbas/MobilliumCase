import Foundation
import Alamofire

protocol UrlRequest {
    var url: URL { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}
