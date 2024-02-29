import UIKit

class ReferencesView: UIView {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: - constraints for UI
    func constraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    //MARK: - addViewForScreen
    func addViews() {
        self.addSubview(tableView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraintsForTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
