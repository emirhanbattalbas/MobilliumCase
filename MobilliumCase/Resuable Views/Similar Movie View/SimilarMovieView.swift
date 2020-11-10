import UIKit

class SimilarMovieView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!

  let similarViewHeight: CGFloat = 200
  
  var viewModel: SimilarMovieViewModel!

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
    contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: similarViewHeight)
    configureCollectionView()
    addSubview(contentView)
  }
  
  func configureCollectionView() {
    collectionView.register(cellType: SimilarMovieCell.self)
  }
}

extension SimilarMovieView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return viewModel.getSimilarMovieCount()
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: SimilarMovieCell = collectionView.dequeueReusableCell(for: indexPath)
    cell.movie = viewModel.getSimilarMovie(indexPath: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didMovieDetail(id: viewModel.getMovieId(indexPath: indexPath))
  }
}

extension SimilarMovieView: SimilarMovieViewModelDelegate {
  func reloadData() {
    collectionView.reloadData()
  }
}
