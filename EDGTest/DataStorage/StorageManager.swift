//
//  StorageManager.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import Foundation

class StorageManager {
  static let shared = StorageManager()

  private let defaults = UserDefaults.standard

  func save<T: Codable>(array: [T], forKey key: String) {
    do {
      let data = try JSONEncoder().encode(array)
      defaults.set(data, forKey: key)
    } catch let error {
      print("Error encoding array:", error)
    }
  }

//  func add<T: Codable>(item: T, toArrayForKey key: String) {
//    if var array = array(forKey: key) as? [T]{
//      array.append(item)
//      save(array: array, forKey: key)
//    } else {
//      save(array: [item], forKey: key)
//    }
//  }

  func removeObject(forKey key: String) {
    defaults.removeObject(forKey: key)
  }

  func array<T: Codable>(forKey key: String) -> [T]? {
    guard let data = defaults.data(forKey: key) else { return nil }

    do {
      let array = try JSONDecoder().decode([T].self, from: data)
      return array
    } catch let error {
      print("Error decoding array:", error)
      return nil
    }
  }
}
