//
//  LocalHandler.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 01.04.2021.
//

import Foundation

class LocalHandler {
    
    static func getStoreList() -> [Item]? {
        
        guard let bundlePath = Bundle.main.path(forResource: "items", ofType: "json") else { return nil }
        
        return readJsonFile(from: bundlePath)
        
    }
    
    static func readJsonFile(from filePath: String) -> [Item]? {
        
        guard let jsonData = try? String(contentsOfFile: filePath).data(using: .utf8) else { return nil }
        guard let decodedData = try? JSONDecoder().decode([Item].self, from: jsonData) else { return nil }
        
        return decodedData
        
    }
    
}
