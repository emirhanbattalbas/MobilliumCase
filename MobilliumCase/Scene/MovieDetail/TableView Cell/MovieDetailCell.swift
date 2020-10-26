import UIKit

class MovieDetailCell: UITableViewCell, Reusable {
  
  @IBOutlet var posterImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var rateLabel: UILabel!
  @IBOutlet var releaseDateLabel: UILabel!

  var movie: MovieDetail? {
    didSet {
      guard let movie = movie else { return }
      ImageViewHelper.shared.downloadImage(with: movie.backdropUrl) { (image) in
        self.posterImageView.image = image
      }
      nameLabel.text = movie.title
      descriptionLabel.text = movie.overview
      rateLabel.text = String(movie.voteAverage ?? 0.0)
      releaseDateLabel.text = DateHelper.shared.dateFormatter(format: movie.releaseDate ?? "")
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  @IBAction func openImdbTapped(_ sender: Any) {
    
  }
  
}
