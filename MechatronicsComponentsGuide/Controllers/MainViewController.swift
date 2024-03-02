
import UIKit

final class MainViewController: UIViewController {

    var mainView: MainView { return self.view as! MainView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.onButtonFirstAction = { [weak self] in self?.actionForFirstButton()}
        mainView.onButtonSecondAction = { [weak self] in self?.actionForSecondButton()}
        mainView.onButtonThirdAction = { [weak self] in self?.actionForThirdButton()}
        

    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    
}


//MARK: - navigation between views
extension MainViewController {
    @objc func actionForFirstButton() {
        let nextController = InfoViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @objc func actionForSecondButton() {
        let nextController = ReferencesViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @objc func actionForThirdButton() {
        let nextController = GeneralViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}

