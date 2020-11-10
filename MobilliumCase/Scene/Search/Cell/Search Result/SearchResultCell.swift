import UIKit

class SearchResultCell: UITableViewCell, Reusable {
  
  @IBOutlet var nameLabel: UILabel!
  
  var movie: MovieResult? {
    didSet{
      guard let movie = movie else { return }
      nameLabel.text = movie.title
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
