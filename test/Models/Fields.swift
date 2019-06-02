//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Fields : Mappable {
	var title : String?
	var file : File?
    var calories : Int?
    var photo : Photo?
    var description : String?

	required init?(map: Map) {

	}

	func mapping(map: Map) {

		title <- map["title"]
		file <- map["file"]
        photo <- map["photo"]
        calories <- map["calories"]
        description <- map["description"]
	}

}
