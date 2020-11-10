import UIKit

class MovieDetailViewController: UIViewController {
  
  @IBOutlet var movieDetailView: MovieDetailView!
  
  var movieDetailViewModel: MovieDetailViewModel!
  var similarMovieViewModel: SimilarMovieViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    movieDetailView.registerCell()
    movieDetailView.initializeSimilarMovieView(viewModel: similarMovieViewModel, delegate: self)
    
    movieDetailViewModel.completion = {
      self.customizeNavigation()
      self.movieDetailView.reloadData()
    }
  }
}

extension MovieDetailViewController {
  func customizeNavigation() {
    navigationItem.title = movieDetailViewModel.getMovie()?.name
  }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MovieDetailCell = tableView.dequeueReusableCell(for: indexPath)
    cell.movie = movieDetailViewModel.getMovie()
    return cell
  }
}


extension MovieDetailViewController: MovieDetailDelegate {
  func didMovieDetail(id: Int) {
    let movieDetailVC = MovieDetailViewController()
    movieDetailVC.movieDetailViewModel = MovieDetailViewModel(id: id)
    movieDetailVC.similarMovieViewModel = SimilarMovieViewModel(id: id)
    navigationController?.pushViewController(movieDetailVC, animated: true)
  }
}
