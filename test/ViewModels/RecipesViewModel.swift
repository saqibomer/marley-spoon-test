//
//  RecipesViewModel.swift
//  test
//
//  Created by TOxIC on 28/05/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import UIKit

class RecipesViewModel: NSObject {
    
    // MARK: - Filter out extra content
    
    func filterResponseForRecipes(items : [Items]?, callBack : @escaping ([Items]?) -> Void){
        var itemsToReturn : [Items] = []
        
        guard let allItems = items else {
            callBack(nil)
            return
        }
        
        for item in allItems {
            if (item.fields?.title) != nil {
                itemsToReturn.append(item)
            }
        }
        
        callBack(itemsToReturn)
    }
    
    // MARK: - Get Image url from Asset
    
    
    func getAssetUrlWithId(id: String, assets : [Asset]?, callBack : @escaping (String?) -> Void){
        var urlString : String?
        
        guard let allAssets = assets else {
            callBack(nil)
            return
        }
        
        print(id)
        
        for asset in allAssets {
            if asset.sys?.id == id {
                
                if let url = asset.fields?.file?.url {
                    urlString = url.components(separatedBy: "//")[1]
                }
                break
            }
        }
        
        callBack(urlString)
    }
    

}
