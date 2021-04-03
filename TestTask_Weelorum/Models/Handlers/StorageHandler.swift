//
//  StorageHandler.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageHandler {
    
    static func saveObject(_ item: ItemForBasket) {
        
        try! realm.write {
            realm.add(item)
        }
    }
    
    static func deleteObject(_ item: ItemForBasket) {
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
