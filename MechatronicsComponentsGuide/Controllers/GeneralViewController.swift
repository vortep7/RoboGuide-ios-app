
import UIKit

class GeneralViewController: UIViewController {
    
    var generalView:GeneralView {return self.view as! GeneralView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        generalView.onAddActionSecondButton = {[weak self] in self?.secondAction()}
        generalView.onAddActionSecondButton = {[weak self] in self?.secondAction()}
        
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }
    
//    @objc func firstAction() {
//        let nextController =
//        navigationController?.pushViewController(next, animated: true)
//    }
    
    @objc func secondAction() {
        let nextController = ProjectsViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}



