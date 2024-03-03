
import Foundation

//MARK: - general UserDefault protocol
protocol UserDefaultManagerProtocol {
    func set(_ object: Any?, forKey key: DataManager.Keys)
    func int(_ key: DataManager.Keys) -> Int?
    func string(_ key: DataManager.Keys) -> String?
    func date(_ key: DataManager.Keys) -> Date?
}

class DataManager {
    public enum Keys: String {
        case test
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) ->Any? {
        userDefaults.object(forKey: key)
    }
}

//MARK: - UserDefaultManagerProtocol
extension DataManager:UserDefaultManagerProtocol {
    func int(_ key: Keys) -> Int? {
        restore(forKey: key.rawValue) as? Int
    }
    
    func string(_ key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    
    func date(_ key: Keys) -> Date? {
        restore(forKey: key.rawValue) as? Date
    }
    
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func remove(_ key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
