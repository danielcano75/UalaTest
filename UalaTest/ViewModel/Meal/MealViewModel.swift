//
//  MealViewModel.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import UIKit

class MealViewModel: NSObject {
    private let constant = Constant.default
    
    var filter: String = ""
    var datasource: [MealModel] = []
    var selected: MealModel?
    var reload: (() -> ())? = nil
    
    // Task for get all meals or meals with search term
    func meals() {
        // end-point to call
        let search = constant.serverUrl + constant.v1 + (filter.isEmpty ? constant.search : constant.search + "?\(filter.lowercased())")
        guard let url = URL(string: search) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            // this is extension func for map data to object Codable
            guard let meals = MealListModel.toObject(of: MealListModel.self, data) else {
                self.datasource = []
                self.reload?()
                return
            }
            // set and pulbish changes
            self.datasource = meals.meals
            self.reload?()
        }.resume()
    }
    
}
