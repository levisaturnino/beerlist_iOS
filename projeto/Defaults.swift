//
//  Defaults.swift
//  projeto
//
//  Created by iMac Mobilicidade on 14/02/2019.
//  Copyright © 2019 cesar. All rights reserved.
//

import Foundation
struct Defaults {
    
    static let (nameKey, priceKey,flowKey) = ("name", "price","flow")
    static let userSessionKey = "com.save.usersession"
       static let userFlowKey = "flow"
    struct Model {
        var name: String?
        var price: String?
        
        init(_ json: [String: String]) {
            self.name = json[nameKey]
            self.price = json[priceKey]
        }
    }
    
    static var saveListBeer = { (beers: Array<Beer>) in
        UserDefaults.standard.set([nameKey: beers], forKey: userSessionKey)
    }
    
    static var saveFlow = {(isFlow: Bool) in
        UserDefaults.standard.set(isFlow, forKey: userFlowKey)
    }
    
    static var getFlow = {return  UserDefaults.standard.bool(forKey: userFlowKey)}
    
    static var saveNameAndPrice = { (name: String, price: String) in
        UserDefaults.standard.set([nameKey: name, priceKey: price], forKey: userSessionKey)
    }
    
    static var getNameAndPrice = { _ -> Model in
        return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }(())
    
    static func clearFlowData(){
        UserDefaults.standard.removeObject(forKey: userFlowKey)
    }
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
    
   
}
