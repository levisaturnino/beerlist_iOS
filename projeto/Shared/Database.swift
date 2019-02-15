//
//  Database.swift
//  projeto
//
//  Created by Levi Saturnino on 14/01/19.
//  Copyright © 2019 cesar. All rights reserved.
//
import Foundation

class Database {
    
    static let shared = Database()
    var storage:Array<Beer> = []
    
    private init(){}
    
    func insert(add value: Beer) {
        self.storage.append(value)
    }
    
    func delete(add value: Beer) {
       if let index = self.storage.index(of: value){
            self.storage.remove(at: index)
        }
    }
    
    func list() -> Array<Beer>{
        return self.storage
    }
    
    static func instance() -> Database {
        return self.shared
    }
}
