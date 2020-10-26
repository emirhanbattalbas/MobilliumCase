import UIKit
import Foundation

protocol MovieDetailDelegate: AnyObject {
  func didMovieDetail(id: Int)
}

class UpComingMovieView: UIView {
  
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var pageControl: UIPageControl!
  @IBOutlet var contentView: UIView!
  
  var viewModel = UpComingMovieViewModel()
  weak var delegate: MovieDetailDelegate?
  
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
    contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
    addSubview(contentView)
    configureCollectionView()
  }
  
  func configureCollectionView() {
    viewModel.completion = { isSucces -> Void in
      if isSucces {
        self.nameLabel.text = self.viewModel.getMovieName(row: 0)
        self.configurePageControl()
        self.collectionView.reloadData()
      }
    }
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(cellType: UpComingMovieCell.self)
  }
  
  func configurePageControl() {
    pageControl.numberOfPages = viewModel.getUpComingMovieCount()
    pageControl.currentPage = 0
    pageControl.pageIndicatorTintColor = UIColor.lightGray
    pageControl.currentPageIndicatorTintColor = UIColor.white
  }
}

extension UpComingMovieView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return viewModel.getUpComingMovieCount()
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UpComingMovieCell = collectionView.dequeueReusableCell(for: indexPath)
    cell.movie = viewModel.getUpComingMovie(indexPath: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didMovieDetail(id: viewModel.getMovieId(indexPath: indexPath))
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
    let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
    if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
      pageControl.currentPage = visibleIndexPath.row
      nameLabel.text = viewModel.getMovieName(row: visibleIndexPath.row)
    }
  }
}
