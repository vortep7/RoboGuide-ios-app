
import Foundation
import UIKit

struct Component {
    let title: String
    let review: String
    let index: Int
    let price: Int
    let image: UIImage
}



//MARK: - generate data for collection panel
struct CollectionSource {
    static func createComponents() -> [Component] {
        let arrayOfComponents = [
            Component(title: "FirstRobot(PROLevel)", review: "Review1", index: 1, price: 100, image: UIImage(named: "one")!),
            Component(title: "SecondRobor(mediumLevel)", review: "Review1", index: 1, price: 100, image: UIImage(named: "two")!),
            Component(title: "ThirdRobor(easyLevel)", review: "Review1", index: 1, price: 100, image: UIImage(named: "three")!),
            Component(title: "LastRobot(mediumLevel", review: "Review1", index: 1, price: 100, image: UIImage(named: "four")!),
            
        ]
        return arrayOfComponents
    }
}


