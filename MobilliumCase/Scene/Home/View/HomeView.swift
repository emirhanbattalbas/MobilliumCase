import UIKit

class HomeView: UIView {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  
  func customizeSearchBar(delegate: UISearchBarDelegate) {
    searchBar.placeholder = "Search"
    searchBar.delegate = delegate
  }
  
  func registerCell() {
    tableView.register(cellType: MovieListCell.self)
  }
  
  func initializeUpComingMovieView(delegate: MovieDetailDelegate) {
    let headerView = UpComingMovieView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    headerView.delegate = delegate
    tableView.tableHeaderView = headerView
  }
  
}
