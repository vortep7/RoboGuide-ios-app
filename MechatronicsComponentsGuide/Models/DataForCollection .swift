
import Foundation
import UIKit

struct Component {
    let title: String
    let review: String
    let index: Int
    let price: Int
    let country: Country
    
    let image: UIImage
}

enum Country {
    case Russia
    case USA
    case Europe
}

enum TitleImage: String {
    case One = "1"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Tenv = "10"
}


//MARK: - generate data for collection panel
struct CollectionSource {
    static func createComponents() -> [Component] {
        let arrayOfComponents = [
            Component(title: "Title1", review: "Review1", index: 1, price: 100, country: .Europe, image: UIImage(named: TitleImage.One.rawValue)!),
            Component(title: "Title2", review: "Review1", index: 1, price: 100, country: .Europe, image: UIImage(named: TitleImage.Two.rawValue)!),
            Component(title: "Title3", review: "Review1", index: 1, price: 100, country: .Europe, image: UIImage(named: TitleImage.Three.rawValue)!),
            Component(title: "Title4", review: "Review1", index: 1, price: 100, country: .Europe, image: UIImage(named: TitleImage.Four.rawValue)!),
            Component(title: "Title5", review: "Review1", index: 1, price: 100, country: .Europe, image: UIImage(named: TitleImage.Five.rawValue)!),
        ]
        
        return arrayOfComponents
    }
}
