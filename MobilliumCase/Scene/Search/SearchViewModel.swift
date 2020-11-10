import Foundation
import UIKit

class SearchViewModel {
  private let movies: Movie?
  
  init(movies: Movie?) {
    self.movies = movies
  }
  
  func getMoviesCount() -> Int {
    return movies?.results.count ?? 0
  }
  
  func isvisibleTableView() -> Bool {
    return (movies?.results.count ?? 0) > 0
  }
  
  func getMovie(indexPath: IndexPath) -> MovieResult? {
    return movies?.results[indexPath.row]
  }
  
  func getMovieId(indexPath: IndexPath) -> Int {
    return (movies?.results[indexPath.row].id)!
  }
}
