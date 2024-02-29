
import Foundation

struct Author {
    var name: String
    var review: String
    var reference: String

}


//MARK: - Return array of author 
struct Source {
    static func createAuthor() -> [Author] {
        let arrayOfContacts = [
            Author(name: "Andrey", review: "Приятный тип", reference: "e"),
            Author(name: "Andrey", review: "НеПриятный тип", reference:  "e"),
            Author(name: "Andrey", review: "Приятный тип", reference:  "e"),
            Author(name: "Andrey", review: "Приятный тип", reference:  "e"),
            Author(name: "Andrey", review: "Приятный тип", reference:  "e"),
            Author(name: "Andrey", review: "Приятный тип", reference:  "e"),
            Author(name: "Andrey", review: "Приятный тип", reference:  "e")
        ]
        return arrayOfContacts
    }
}
