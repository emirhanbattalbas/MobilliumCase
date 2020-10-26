import UIKit

class HomeViewModel {
  
  private var nowPlayingList: Movie?
  private var upComingList: Movie?
    
  init(view: HomeView) {
    NetworkClient.nowPlaying { (error, response) in
      if let response = response {
        self.nowPlayingList = response
        view.tableView.reloadData()
      }
    }
  }
  
  func getNowPlaying(indexPath: IndexPath) -> MovieResult? {
    return nowPlayingList?.results[indexPath.row]
  }
  
  func getNowPlayingCount() -> Int {
    return nowPlayingList?.results.count ?? 0
  }
}
