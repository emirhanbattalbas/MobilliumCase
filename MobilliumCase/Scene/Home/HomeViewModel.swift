import UIKit

class HomeViewModel {
  
  private var nowPlayingList: Movie?
  private var searchMovie: Movie?
  
  init(view: HomeView) {
    NetworkClient.nowPlaying { (error, response) in
      if let response = response {
        self.nowPlayingList = response
        view.tableView.reloadData()
      }
    }
  }
  
  init() {}
  
  func movieSearchRequest(searchText: String, completion: @escaping (Bool)->()) {
    NetworkClient.movieSearch(text: searchText) { (error, response) in
      self.searchMovie = response
      completion(true)
    }
  }

  func getNowPlaying(indexPath: IndexPath) -> MovieResult? {
    return nowPlayingList?.results[indexPath.row]
  }
  
  func getNowPlayingCount() -> Int {
    return nowPlayingList?.results.count ?? 0
  }
  
  func getMovieId(indexPath: IndexPath) -> Int {
    return (nowPlayingList?.results[indexPath.row].id)!
  }
  
  func getSearchMovie() -> Movie? {
    return searchMovie
  }
}
