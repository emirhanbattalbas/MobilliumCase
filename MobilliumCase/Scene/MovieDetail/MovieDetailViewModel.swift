import Foundation
import UIKit

class MovieDetailViewModel {
  private var movieDetail: MovieDetail?
  var completion: (() -> (Void))!

  init(id: Int) {
    NetworkClient.movieDetail(id: id) { (error, response) in
      if let movieDetail = response {
        self.movieDetail = movieDetail
      }
      self.completion()
    }
  }
  
  func getMovie() -> MovieDetail? {
    return movieDetail
  }
}
