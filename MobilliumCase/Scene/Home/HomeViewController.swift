import UIKit
import Alamofire

class HomeViewController: UIViewController {
  
  @IBOutlet var homeView: HomeView!
  
  var viewModel: HomeViewModel!
  let searchView = SearchView.init(frame: UIApplication.shared.keyWindow!.bounds)
  var timer:Timer?
    
  override func viewDidLoad() {
    super.viewDidLoad()
    customizeNavigation()
    viewModel = HomeViewModel(view: homeView)

    homeView.customizeSearchBar(delegate: self)
    homeView.initializeUpComingMovieView(delegate: self)
    homeView.registerCell()
    
    searchView.delegate = self
    searchView.searchViewDelegate = self
  }
  
  deinit {
    viewModel = nil
  }
  
  private func movieDetail(id: Int) {
    let movieDetailVC = MovieDetailViewController()
    movieDetailVC.movieDetailViewModel = MovieDetailViewModel(id: id)
    movieDetailVC.similarMovieViewModel = SimilarMovieViewModel(id: id)
    navigationController?.pushViewController(movieDetailVC, animated: true)
  }
  
  func isVisibleSearchView() -> Bool {
    return view.subviews.last?.isEqual(searchView) ?? false
  }
  
}

// MARK: - Customize NavigationBar
extension HomeViewController {
  func customizeNavigation() {
    navigationItem.titleView = homeView.searchBar
  }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getNowPlayingCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MovieListCell = tableView.dequeueReusableCell(for: indexPath)
    cell.movie = viewModel.getNowPlaying(indexPath: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    movieDetail(id: viewModel.getMovieId(indexPath: indexPath))
  }
}

// MARK: - Push Movie Detail
extension HomeViewController: MovieDetailDelegate {
  func didMovieDetail(id: Int) {
    movieDetail(id: id)
  }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
  
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    searchView.initializeView()
    searchView.viewModel = SearchViewModel(movies: nil)
    view.addSubview(searchView)
    return true
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    timer?.invalidate()
      
    if searchText.isEmpty {
      searchView.viewModel = SearchViewModel(movies: nil)
      searchView.removeView()
    }
    
    if !isVisibleSearchView() {
      searchView.initializeView()
      view.addSubview(searchView)
    }

    if searchText.count > 2 {
      timer = Timer.scheduledTimer(timeInterval: 0.5,
                                   target: self,
                                   selector: #selector(movieSearchRequest(timer:)),
                                   userInfo: searchText,
                                   repeats: false)
    }
  }
  
  @objc func movieSearchRequest(timer: Timer) {
    let searchText = timer.userInfo as! String
    viewModel.movieSearchRequest(searchText: searchText) { _ in
      self.searchView.viewModel = SearchViewModel(movies: self.viewModel.getSearchMovie())
    }
  }
}

extension HomeViewController: SearchViewDelegate {
  func didDismissKeyboard() {
    homeView.searchBar.endEditing(true)
  }
}
