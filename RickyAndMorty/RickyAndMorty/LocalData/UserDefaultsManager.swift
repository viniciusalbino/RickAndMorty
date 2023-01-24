//
//  SharedUserDefaults.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation

enum UserDefaultType: String, CaseIterable {
    case favorites = "favorites"
    
    var value : String {
        return self.rawValue
    }
}

class UserDefaultsManager: NSObject {
    
    static let shared = UserDefaultsManager()
    let userDefaults: UserDefaults?
    
    
    private override init() {
        userDefaults = UserDefaults(suiteName: "group.RickyAndMorty")
    }
    
    func remove(for key: UserDefaultType) {
        userDefaults?.removeObject(forKey: key.value)
    }
    
    func purge() {
        let keys = UserDefaultType.allCases
        keys.forEach {
            remove(for: $0)
        }
    }
}

extension UserDefaultsManager {
    
    func set<T>(_ value: T?, forKey key: UserDefaultType) where T: Encodable {
        guard let tempValue = value else {
            userDefaults?.set(nil, forKey: key.value)
            return
        }
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(tempValue) else {
            userDefaults?.set(nil, forKey: key.value)
            return
        }
        let json = String(data: jsonData, encoding: .utf8)
        userDefaults?.set(json, forKey: key.value)
    }
    
    func get<T: Decodable>(objectForkey key: UserDefaultType, type: T.Type) -> T? {
        let jsonString = getObject(key.value) as? String
        let jsonData = jsonString?.data(using: .utf8)
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: jsonData ?? Data())
    }
    
    func set(bool: Bool, for key: UserDefaultType) {
        userDefaults?.set(bool, forKey: key.value)
    }
    
    func get(for key: UserDefaultType) -> Bool? {
        let result = userDefaults?.bool(forKey: key.value)
        return result
    }
}

extension UserDefaultsManager {
    
    private func getObject(_ key: String) -> Any? {
        return userDefaults?.object(forKey: key)
    }
}
