import UIKit
import Kingfisher

class MovieListCell: UITableViewCell, Reusable {
  
  @IBOutlet var posterImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  var movie: MovieResult? {
    didSet {
      guard let movie = movie else { return }
      ImageViewHelper.shared.downloadImage(with: Global.Network.imageBaseUrl + (movie.posterPath ?? "")) { (image) in
        self.posterImageView.image = image
      }
      nameLabel.text = movie.originalTitle
      descriptionLabel.text = movie.title
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
