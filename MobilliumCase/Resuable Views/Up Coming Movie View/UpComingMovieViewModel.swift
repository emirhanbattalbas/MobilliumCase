
import UIKit

class UpComingMovieViewModel {
  private var upComingMovie: Movie?
  
  var completion: ((_ isSucces: Bool) -> (Void))!
  
  init() {
    NetworkClient.upComing { (error, response) in
      if let response = response {
        self.upComingMovie = response
        self.completion(true)
      }
      self.completion(false)
    }
  }
  
  func getUpComingMovieCount() -> Int {
    return upComingMovie?.results.count ?? 0
  }
  
  func getUpComingMovie(indexPath: IndexPath) -> MovieResult? {
    return upComingMovie?.results[indexPath.row]
  }
  
  func getMovieName(row: Int) -> String {
    return upComingMovie?.results[row].title ?? ""
  }
  
  func getMovieId(indexPath: IndexPath) -> Int {
    return upComingMovie?.results[indexPath.row].id ?? 0
  }
  
}
