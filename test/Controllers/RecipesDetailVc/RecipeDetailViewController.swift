//
//  RecipeDetailViewController.swift
//  test
//
//  Created by TOxIC on 02/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeImgView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var urlString   : String?
    var recipeTitle : String?
    var descrip     : String?
    var calories    : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = self.recipeTitle {
            self.recipeTitleLabel.text = title
        } else {
            self.recipeTitleLabel.text = ""
        }
        
        if let des = self.descrip {
            self.descLabel.text = des
        } else {
            self.descLabel.text = ""
        }
        
        if let cal = self.calories {
            self.caloriesLabel.text = cal
        } else {
            self.caloriesLabel.text = ""
        }
        
        if let urlStr = urlString {
            
            let url = URL(string: urlStr)
            self.recipeImgView.kf.setImage(with: url)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
