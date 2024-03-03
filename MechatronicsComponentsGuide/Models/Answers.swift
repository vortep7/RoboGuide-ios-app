
import Foundation

class Answers {
    
    
    func checkPositiveAnswer(_ index: Int, _ myAnswer:inout Int) -> Int {
        switch index {
        case 1000:
            myAnswer = 1
        case 2000:
            myAnswer = 2
        case 3000:
            myAnswer = 3
        case 4000:
            myAnswer = 4
        default:
            myAnswer = 999
        }
        
        return myAnswer
    }
}
