
import UIKit

class GeneralViewController: UIViewController {
    
    var generalView:GeneralView {return self.view as! GeneralView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        generalView.collectionView.dataSource = self
//        generalView.collectionView.delegate = self
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }

}

extension GeneralViewController: UICollectionViewDelegate{
    
}

//extension GeneralViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
