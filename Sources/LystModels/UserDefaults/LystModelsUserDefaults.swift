//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 08/08/2021.
//

import Foundation

public struct UserDefaultInfo<Value> {
    public var key: String
    public var defaultValue: Value
}

extension UserDefaultInfo {

    public func get() -> Value {
        guard let valueUntyped = UserDefaults.standard.object(forKey: self.key), let value = valueUntyped as? Value else {
            return self.defaultValue
        }

        return value
    }

    public func set(_ value: Value) {
        UserDefaults.standard.set(value, forKey: self.key)
    }

    public func getObject<T: Decodable>() -> T? {
        if let data = UserDefaults.standard.data(forKey: self.key) {
            return try? JSONDecoder().decode(T.self, from: data)
        } else {
            return nil
        }
    }

    public func setObject<T: Encodable>(encodable: T) {
        if let data = try? JSONEncoder().encode(encodable) {
            UserDefaults.standard.setValue(data, forKey: self.key)
        }
    }
}

/// Unique Key for setting and getting Data Model version saved in UserDefaults
public enum DataVersionKey: String {
    case dogs
}

/// Set Data Model version from current DateTimeStamp converted to Int
/// This should be set in Request's response parser before mapping the data
/// - Parameter key: unique reference from enum of DataVersionKey

public func setDataVersion(for key: DataVersionKey) {
    let currentTimeStampInt: Int = Int(Date().timeIntervalSince1970)
    UserDefaultInfo(key: key.rawValue, defaultValue: 0).set(currentTimeStampInt)
}

/// Get Current Data Model version from the last saved DateTimeStamp as Int
/// - Parameter key: unique reference from enum of DataVersionKey
/// - Returns: Current Data Model version from the last saved DateTimeStamp as Int

public func getDataVersion(for key: DataVersionKey) -> Int {
    return UserDefaultInfo(key: key.rawValue, defaultValue: 0).get()
}

// Save and load a custom object to UserDefaults.
// Note that the Model must conform to Codable. See Language model

extension UserDefaults {

    public func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }

    public func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }

}
