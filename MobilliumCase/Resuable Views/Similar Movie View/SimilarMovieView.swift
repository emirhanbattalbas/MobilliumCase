import UIKit

class SimilarMovieView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!

  var viewModel: SimilarMovieViewModel!

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
    configureCollectionView()
    addSubview(contentView)
  }
  
  func configureCollectionView() {
    guard viewModel != nil else { return }
    viewModel.completion = { isSucces -> Void in
      if isSucces {
        self.collectionView.reloadData()
      }
    }
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(cellType: UpComingMovieCell.self)
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
    return CGSize(width: UIScreen.main.bounds.width, height: 200)
  }
  
}
