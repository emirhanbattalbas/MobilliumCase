import UIKit

class MovieDetailView: UIView {
  
  @IBOutlet var tableView: UITableView!
  
  func registerCell() {
    tableView.register(cellType: MovieDetailCell.self)
  }
  
  func initializeSimilarMovieView(viewModel: SimilarMovieViewModel, delegate: MovieDetailDelegate) {
    let footerView = SimilarMovieView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    footerView.viewModel = viewModel
    footerView.viewModel.delegate = footerView
    footerView.delegate = delegate
    tableView.tableFooterView = footerView
  }
  
  func reloadData() {
    tableView.reloadData()
  }
  
}
