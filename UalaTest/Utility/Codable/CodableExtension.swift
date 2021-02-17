//
//  CodableExtension.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import Foundation

extension Decodable {
    static func toObject<D: Decodable>(of type: D.Type = D.self,
                                       _ data: Data) -> D? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(D.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
