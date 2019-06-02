//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class File : Mappable {
	var url : String?
	var details : Details?
	var fileName : String?
	var contentType : String?

	required init?(map: Map) {

	}

    func mapping(map: Map) {

		url <- map["url"]
		details <- map["details"]
		fileName <- map["fileName"]
		contentType <- map["contentType"]
	}

}
