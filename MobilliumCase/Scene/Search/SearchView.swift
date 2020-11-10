import Foundation
import UIKit

protocol SearchViewDelegate: AnyObject {
  func didDismissKeyboard()
}

class SearchView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var transparantView: UIView!
  
  weak var delegate: MovieDetailDelegate?
  weak var searchViewDelegate: SearchViewDelegate?
  
  var viewModel: SearchViewModel! {
    didSet {
      tableView.isHidden = !(viewModel.isvisibleTableView())
      tableView.reloadData()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
    fatalError("init(coder:) has not been implemented")
  }
  
  final func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return nibView
  }
  
  private func commonInit() {
    contentView = loadViewFromNib()
    addSubview(contentView)
    contentView.frame = CGRect(x: 0,
                               y: 0,
                               width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height)
    registerCell()
  }
  
  private func registerCell() {
    tableView.register(cellType: SearchResultCell.self)
  }
  
  func initializeView() {
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: .allowUserInteraction,
                   animations: {
                    self.transparantView.alpha = 0.4
                   }, completion: nil)
  }
  
  func removeView() {
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: .allowAnimatedContent) {
      self.tableView.isHidden = true
      self.transparantView.alpha = 0
    } completion: { completed in
      if completed {
        UIView.animate(withDuration: 0.3) {
          self.searchViewDelegate?.didDismissKeyboard()
          self.removeFromSuperview()
        }
      }
    }
  }
  
  @IBAction func closeSearchTapped(_ sender: Any) {
    removeView()
  }
}


extension SearchView: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getMoviesCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SearchResultCell = tableView.dequeueReusableCell(for: indexPath)
    cell.movie = viewModel.getMovie(indexPath: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.didMovieDetail(id: viewModel.getMovieId(indexPath: indexPath))
  }
}
