import UIKit

class MovieDetailView: UIView {
  
  @IBOutlet var tableView: UITableView!
  
  func registerCell() {
    tableView.register(cellType: MovieDetailCell.self)
  }
  
  func initializeSimilarMovieView(viewModel: SimilarMovieViewModel) {
    let footerView = SimilarMovieView()
    footerView.viewModel = viewModel
    tableView.tableFooterView = footerView
  }
  
  func reloadData() {
    tableView.reloadData()
  }
  
}
