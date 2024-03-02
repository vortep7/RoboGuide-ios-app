
import Foundation

class JSONParcer {
    static let shared = JSONParcer()
    private init() {}
    
    var arrayOfText = [String]()
    var arrayOfLevel = [String]()
    var arrayOfAnswer = [[String]]()
    var arrayOfpositiveAnswers = [String]()

    func fetchData() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json")
        else  {return}
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //create JSON array
            guard let array = json as? [Any] else {return}
            
            for question in array {
                guard let questionProperty = question as? [String:Any] else {return}
                guard let text = questionProperty["text"] as? String else {return}
                guard let level = questionProperty["level"] as? String else {return}
                guard let answers = questionProperty["answers"] as? [String] else {return}
                guard let positiveAnswer = questionProperty["positiveAnswer"] as? String else {return}
                
                arrayOfText.append(text)
                arrayOfLevel.append(level)
                arrayOfAnswer.append(answers)
                arrayOfpositiveAnswers.append(positiveAnswer)
            }
        }
        catch {
            print(ParcerError.badData)
        }
    }
    
}



enum ParcerError: Error {
    case badData
    case badPath
    case badProperty
}
