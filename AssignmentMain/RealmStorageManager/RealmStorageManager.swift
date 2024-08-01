//
//  RealmStorageManager.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import RealmSwift

//MARK: - DataStorageManager class for managing local database
class RealmStorageManager {
    
    //MARK: - Properties
    static var shared = RealmStorageManager()
    private let realm: Realm?
    
    private init() {
        self.realm = try? Realm()
    }
    
    //MARK: - Following method will save the data into realm database
    func saveData<T:Object>(data: [T]) {
        try? realm?.write {
            realm?.add(data, update: .modified)
        }
    }
    
    //MARK: - Following method will fetch the data from realm database
    func fetchData<T:Object>(obj:T.Type) -> [T]? {
        if let realm = realm?.objects(T.self) {
            if !realm.isEmpty {
                return (Array(realm))
            }
        }
        return (nil)
    }
    
    //MARK: - Following method will delete the data from realm database
    func deleteAll<T:Object>(obj: T.Type) {
        try? realm?.write {
            if let obj = realm?.objects(T.self) {
                realm?.delete(obj)
            }
        }
    }
}
