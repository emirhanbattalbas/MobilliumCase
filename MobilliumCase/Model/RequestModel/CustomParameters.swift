import UIKit

struct CommonParameters: Codable {
  var apiKey: String = Global.Network.apiKey
  var language: String = Locale.current.languageCode ?? "en-US"
  var page: Int? = 1
  var searchQuery: String?
  
  init(page: Int? = nil, query: String? = nil) {
    self.page = page
    self.searchQuery = query
  }
  
  enum CodingKeys: String, CodingKey {
    case apiKey = "api_key"
    case language
    case page
    case searchQuery = "query"
  }
}
