import Foundation

protocol VideoProtocol{
    func sendReference(index:Int) -> String
}


class Video:VideoProtocol {
    static let video = Video()
    
    func sendReference(index: Int) -> String {
        switch index {
        case 1: return VideoReference.one.rawValue
        case 2: return VideoReference.two.rawValue
        case 3: return VideoReference.three.rawValue
        default: return VideoReference.error.rawValue
        }
    }
    
    private init() {}
}


enum VideoReference: String  {
    case one = "https://www.youtube.com/@Robotiq"
    case two = "https://www.youtube.com/@vexrobotics"
    case three = "https://www.youtube.com/@speedbotrobotics3148"
    
    case error = "error"
}
