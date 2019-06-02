//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Image : Mappable {
	var width : Int?
	var height : Int?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		width <- map["width"]
		height <- map["height"]
	}

}
