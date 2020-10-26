import UIKit

class HomeViewController: UIViewController {
  
  lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 56))

  @IBOutlet var homeView: HomeView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = searchBar
  }
}
