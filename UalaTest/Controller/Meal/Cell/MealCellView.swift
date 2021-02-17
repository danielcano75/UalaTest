//
//  MealCellView.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import UIKit
import SDWebImage

class MealCellView: UITableViewCell {
    static let identifier: String = "MealCellView"
    // Corer round for thumbnail
    private let corner: CGFloat = 5
    
    @IBOutlet weak var thubmnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // load meal data
    func load(meal: MealModel) {
        self.name.text = meal.meal
        self.category.text = meal.category
        self.thubmnail.layer.cornerRadius = corner
        self.thubmnail.clipsToBounds = true
        self.thubmnail.image = nil
        // Download thumbanail by url
        SDWebImageDownloader.shared.downloadImage(with: URL(string: meal.thumbnail)) { image, data, error, success in
            // Set downloaded thumnail
            self.thubmnail.image = image
        }
    }
}
