import UIKit
class SecondViewController: UIViewController {
    @IBOutlet weak var flowerImageCollectionView: UICollectionView!
    let flowerNames = ["Aboli", "Jarbera", "Lily", "Mogra","Pink Rose", "Rose"]
    let flowerImages = [UIImage(named: "Aboli"), UIImage(named: "Jarbera"), UIImage(named: "Lily"), UIImage(named: "Mogra"), UIImage(named: "PinkRose"), UIImage(named: "Rose"), ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibFile = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.flowerImageCollectionView.register(nibFile, forCellWithReuseIdentifier: "CollectionViewCell")
        // Do any additional setup after loading the view.
        self.flowerImageCollectionView.dataSource = self
        self.flowerImageCollectionView.delegate = self
    }
}

extension SecondViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flowerNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.flowerImageCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.flowerImage.image = flowerImages[indexPath.row]
        cell.flowerName.text = flowerNames[indexPath.row]
        return cell
    }
}
extension SecondViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height/4)
    }
}
