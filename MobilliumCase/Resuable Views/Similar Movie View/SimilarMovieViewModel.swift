import UIKit

class SimilarMovieViewModel {
  private var movie: Movie?
  var completion: ((_ isSucces: Bool) -> (Void))!

  init(id: Int) {
    NetworkClient.similarMovie(id: id) { (error, response) in
      if let response = response {
        self.movie = response
      } else {
        print(error!)
      }
    }
  }
  
  func getSimilarMovieCount() -> Int {
    return movie?.results.count ?? 0
  }
  
  func getSimilarMovie(indexPath: IndexPath) -> MovieResult? {
    return movie?.results[indexPath.row]
  }
  
}
