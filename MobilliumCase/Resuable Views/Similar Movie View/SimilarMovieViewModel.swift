import UIKit

protocol SimilarMovieViewModelDelegate: AnyObject {
  func reloadData()
}

class SimilarMovieViewModel {
  private var movie: Movie?

  weak var delegate:SimilarMovieViewModelDelegate?
  
  init(id: Int) {
    NetworkClient.similarMovie(id: id) { (error, response) in
      if let response = response {
        self.movie = response
        self.delegate?.reloadData()
      } else {
      }
    }
  }

  
  func getSimilarMovieCount() -> Int {
    return movie?.results.count ?? 0
  }
  
  func getSimilarMovie(indexPath: IndexPath) -> MovieResult? {
    return movie?.results[indexPath.row]
  }
  
  func getMovieId(indexPath: IndexPath) -> Int {
    return (movie?.results[indexPath.row].id)!
  }
}
