//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//


import Foundation
import ObjectMapper

class ContentfulBase : Mappable {
	var sys : Sys?
	var total : Int?
	var skip : Int?
	var limit : Int?
	var items : [Items]?
	var includes : Includes?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		sys <- map["sys"]
		total <- map["total"]
		skip <- map["skip"]
		limit <- map["limit"]
		items <- map["items"]
		includes <- map["includes"]
	}

}
