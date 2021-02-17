//
//  Constant.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import Foundation

fileprivate let defServerUrL = "https://www.themealdb.com/api"
fileprivate let defV1        = "/json/v1/1"
fileprivate let defSearch    = "/search.php"

struct Constant {
    let serverUrl: String
    let v1: String
    let search: String
    
    static let `default` = Constant(serverUrl: defServerUrL,
                                    v1: defV1,
                                    search: defSearch)
}
