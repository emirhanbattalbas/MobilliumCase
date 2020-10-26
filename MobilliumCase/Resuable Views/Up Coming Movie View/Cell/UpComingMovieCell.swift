import UIKit

class UpComingMovieCell: UICollectionViewCell, Reusable {
    
  @IBOutlet var posterImageView: UIImageView!
  
  var movie: MovieResult? {
    didSet {
      guard let movie = movie else { return }
      ImageViewHelper.shared.downloadImage(with: movie.backdropUrl) { (image) in
        self.posterImageView.image = image
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}

