//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Details : Mappable {
	var size : Int?
	var image : Image?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		size <- map["size"]
		image <- map["image"]
	}

}
