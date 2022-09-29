import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var flowerImageTableView: UITableView!
    
    let flowerNames = ["Aboli", "Jarbera", "Lily", "Mogra","Pink Rose", "Rose"]
    let flowerImages = [UIImage(named: "Aboli"), UIImage(named: "Jarbera"), UIImage(named: "Lily"), UIImage(named: "Mogra"), UIImage(named: "PinkRose"), UIImage(named: "Rose"), ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.flowerImageTableView.dataSource = self
        self.flowerImageTableView.delegate = self
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flowerNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = flowerImageTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
        cell.flowerImageView.image = flowerImages[indexPath.row]
        cell.flowerNameLabel.text = flowerNames[indexPath.row]
        return cell
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

