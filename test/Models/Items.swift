//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Items : Mappable {
	var sys : Sys?
	var fields : Fields?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		sys <- map["sys"]
		fields <- map["fields"]
	}

}
