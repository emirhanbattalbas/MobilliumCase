import UIKit
import Foundation

class SimilarMovieCell: UICollectionViewCell, Reusable {
  
  @IBOutlet var posterImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var releaseLabel: UILabel!
  
  var movie: MovieResult? {
    didSet {
      guard let movie = movie else { return }
      ImageViewHelper.shared.downloadImage(with: movie.posterPath ?? "") { (image) in
        self.posterImageView.image = image
      }
      nameLabel.text = movie.title
      releaseLabel.text = DateHelper.shared.dateFormatter(format: movie.releaseDate ?? "")
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}
