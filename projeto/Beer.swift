//
//  Beer.swift
//  projeto
//
//  Created by Levi Saturnino on 15/01/19.
//  Copyright © 2019 cesar. All rights reserved.
//

import Foundation
struct Beer : Equatable{

    var name : String
    var price : String
    
    static func == (lhs: Beer, rhs: Beer) -> Bool{
        return lhs.name == rhs.name
    }
}

