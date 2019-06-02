//
//  NetworkRequests.swift
//  test
//
//  Created by TOxIC on 01/06/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class API: NSObject {
    
    
    static let ROOT = "https://cdn.contentful.com"
    static let GetAllEnteries = ROOT+"/spaces/kk2bw5ojx476/environments/master/entries"
    
    
    
}

struct UserRequest : Mappable {
    
    
    var token   : String?
    
    
    init(token : String) {
        self.token = token
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.token <- map["access_token"]
        
    }
    
}

class RequestApi : NSObject {
    
    func getRecipes(token : String, callBack : @escaping (ContentfulBase) -> Void){
        
        let parameters  : Parameters =  ["access_token" : token]
        AF.request(API.GetAllEnteries, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ContentfulBase>)  in
            switch response.result {
            case let .success(value):
                DispatchQueue.main.async {
                    callBack(value)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}
