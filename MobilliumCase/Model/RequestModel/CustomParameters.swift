import Foundation

struct CustomModel {
  var apiKey: String = Constant.Network.apiKey
  var language: String = Locale.current.languageCode ?? "en-US"
  var page: Int = 1
  
  enum CodingKeys: String, CodingKey {
    case apiKey = "api_key"
    case language
    case page
  }
}
