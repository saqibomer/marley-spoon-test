//
//  RecipeTableViewCell.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import UIKit
import SkeletonView

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeCalories: UILabel!
    
    var descrip : String?
    var imgUrl  : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.recipeImageView.showAnimatedSkeleton()
        self.recipeTitleLabel.showAnimatedSkeleton()
        self.recipeCalories.showAnimatedSkeleton()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func stopAnimation() {
        self.recipeImageView.hideSkeleton()
        self.recipeTitleLabel.hideSkeleton()
        self.recipeCalories.hideSkeleton()
    }

}
