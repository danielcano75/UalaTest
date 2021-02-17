//
//  MealDetailViewController.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import UIKit
import SDWebImage

// MARK: Lyfe Cycle
class MealDetailViewController: UIViewController {
    var meal: MealModel!
    @IBOutlet weak var thubmnail: UIImageView!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var ingredient1: UILabel!
    @IBOutlet weak var ingredient2: UILabel!
    @IBOutlet weak var ingredient3: UILabel!
    @IBOutlet weak var ingredient4: UILabel!
    @IBOutlet weak var ingredient5: UILabel!
    @IBOutlet weak var ingredient6: UILabel!
    @IBOutlet weak var ingredient7: UILabel!
    @IBOutlet weak var ingredient8: UILabel!
    @IBOutlet weak var ingredient9: UILabel!
    @IBOutlet weak var ingredient10: UILabel!
    @IBOutlet weak var ingredient11: UILabel!
    @IBOutlet weak var ingredient12: UILabel!
    @IBOutlet weak var ingredient13: UILabel!
    @IBOutlet weak var ingredient14: UILabel!
    @IBOutlet weak var ingredient15: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    private func load() {
        title = meal.meal
        
        // Set instructions
        instructions.text = meal.instructions
        
        // Set ingredients
        ingredient1.text = "Ingedient 1: " + meal.ingredient1
        ingredient2.text = "Ingedient 2: " + meal.ingredient2
        ingredient3.text = "Ingedient 3: " + meal.ingredient3
        ingredient4.text = "Ingedient 4: " + meal.ingredient4
        ingredient5.text = "Ingedient 5: " + meal.ingredient5
        ingredient6.text = "Ingedient 6: " + meal.ingredient6
        ingredient7.text = "Ingedient 7: " + meal.ingredient7
        ingredient8.text = "Ingedient 8: " + meal.ingredient8
        ingredient9.text = "Ingedient 9: " + meal.ingredient9
        ingredient10.text = "Ingedient 10: " + meal.ingredient10
        ingredient11.text = "Ingedient 11: " + meal.ingredient1
        ingredient12.text = "Ingedient 12: " + meal.ingredient2
        ingredient13.text = "Ingedient 13: " + meal.ingredient3
        ingredient14.text = "Ingedient 14: " + meal.ingredient14
        ingredient15.text = "Ingedient 15: " + meal.ingredient15
        
        // Download thumbanail by url
        SDWebImageDownloader.shared.downloadImage(with: URL(string: meal.thumbnail)) { image, data, error, success in
            // Set downloaded thumnail
            self.thubmnail.image = image
        }
    }
}
