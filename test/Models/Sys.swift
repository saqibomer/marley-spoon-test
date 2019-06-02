//
//  RecipesVcViewController.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import ObjectMapper

class Sys : Mappable {
    var space : Space?
	var id : String?
    var linkType : String?
	var type : String?
	var createdAt : String?
	var updatedAt : String?
	var environment : Environment?
	var revision : Int?
	var locale : String?

    required init?(map: Map){
        
    }

	func mapping(map: Map) {

        space <- map["space"]
		id <- map["id"]
		type <- map["type"]
        linkType <- map["linkType"]
		createdAt <- map["createdAt"]
		updatedAt <- map["updatedAt"]
		environment <- map["environment"]
		revision <- map["revision"]
		locale <- map["locale"]
	}

}
