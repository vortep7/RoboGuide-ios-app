
import UIKit

class GeneralViewController: UIViewController {
    
    var generalView:GeneralView {return self.view as! GeneralView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generalView.onAddActionFirstButton = {[weak self] in self?.firstAction()}
        generalView.onAddActionSecondButton = {[weak self] in self?.secondAction()}
        
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }
    
    @objc func firstAction() {
        let nextController = TestsViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @objc func secondAction() {
        let nextController = ProjectsViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}



