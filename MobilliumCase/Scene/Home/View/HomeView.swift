import UIKit

class HomeView: UIView {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  
  func customizeSearchBar() {
    searchBar.placeholder = "Search"
    addToolBar()
  }
  
  func initializeTableView(delegate: MovieDetailDelegate) {
    tableView.register(cellType: MovieListCell.self)
    let headerView = UpComingMovieView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    headerView.delegate = delegate
    tableView.tableHeaderView = headerView
  }
  
  func addToolBar() {
    let bar = UIToolbar()
    let done = UIBarButtonItem(title: "Tamam",
                               style: .plain,
                               target: self,
                               action: #selector(dismiss))
    bar.items = [done]
    bar.sizeToFit()
    searchBar.inputAccessoryView = bar
  }
  
  @objc func dismiss() {
    endEditing(true)
  }
}
