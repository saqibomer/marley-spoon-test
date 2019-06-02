//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Includes : Mappable {
	var asset : [Asset]?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		asset <- map["Asset"]
	}

}
