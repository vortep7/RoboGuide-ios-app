
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
            Author(name: "Robotiq TV", review: "Использование гаджетов в реальной жизни", reference: "e"),
            Author(name: "Vex Robotics TV", review: "Последние подвиги их «Герой-бота»", reference:  "e"),
            Author(name: "Robotics Trends", review: "Улучшите свою повседневную жизнь с помощью искусственного интеллекта и других форм роботизированных технологий", reference:  "e"),
            Author(name: "ABB Robotics", review: "Промышленная робототехника", reference:  "e"),
            Author(name: "Aldebaran Robotics", review: "Мировой лидер в области гуманоидных программируемых роботов.", reference:  "e"),
            Author(name: "Rethink Robotics", review: "Sawyer ИИ", reference:  "e"),
            Author(name: "Boston Dynamics", review: "Передовая робототехника", reference:  "e")
        ]
        return arrayOfContacts
    }
}

