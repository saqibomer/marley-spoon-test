//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 28/05/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class RecipesVcViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    @IBOutlet var apiObject: RequestApi!
    @IBOutlet var recipesViewModel: RecipesViewModel!
    
    @IBOutlet weak var loadingIndicator: NVActivityIndicatorView!
    
    var recipes : [Items]?
    var assets  : [Asset]?
    
    let helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadingIndicator.startAnimating()
        let token = "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c"
        self.apiObject.getRecipes(token: token) { (response) in
            
            self.recipesViewModel.filterResponseForRecipes(items: response.items, callBack: { (filteredItems) in
                self.loadingIndicator.stopAnimating()
                if filteredItems!.count > 0 {
                    self.recipes = filteredItems
                    self.assets  = response.includes?.asset
                    self.recipesTableView.reloadData()
                    
                } else { // Show Alert
                    self.helper.showBanner(title: "Arg!!!", subTitle: "No Recipe found.", style: .warning)
                }
            })
            
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = self.recipes else {
            return 0
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        
        let recipe = self.recipes?[indexPath.row]
        
        if let title = recipe?.fields?.title{
            cell.recipeTitleLabel.text = title
            cell.recipeTitleLabel.hideSkeleton()
            
        } else {
            title = ""
            cell.recipeTitleLabel.hideSkeleton()
        }
        
        if let calories = recipe?.fields?.calories {
            cell.recipeCalories.text = "Calories: \(calories)"
            cell.recipeCalories.hideSkeleton()
        } else {
            cell.recipeCalories.text = ""
            cell.recipeCalories.stopSkeletonAnimation()
        }
        
        if let desc = recipe?.fields?.description {
            cell.descrip = desc
        }
        if let id = recipe?.fields?.photo?.sys?.id {
            
            self.recipesViewModel.getAssetUrlWithId(id: id, assets: self.assets) { (urlString) in
                
                if let urlStr = urlString {
                    cell.imgUrl = "https://".appending(urlStr)
                    let url = URL(string: "https://".appending(urlStr))
                    cell.recipeImageView.kf.setImage(with: url) { result in
                        switch result {
                        case .success( _):
                            cell.recipeImageView.hideSkeleton()
                            
                        case .failure(let error):
                            print(error)
                            cell.recipeImageView.hideSkeleton()
                        }
                    }
                }
                
                
            }
        }
        
        return cell
        
    }
    
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "recipeDetailVc") as! RecipeDetailViewController
        if let cell = self.recipesTableView.cellForRow(at: indexPath) as? RecipeTableViewCell {
            
            vc.recipeTitle = cell.recipeTitleLabel.text
            vc.descrip     = cell.descrip
            vc.urlString   = cell.imgUrl
            vc.calories    = cell.recipeCalories.text
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}
