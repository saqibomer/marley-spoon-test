//
//  Helper.swift
//  test
//
//  Created by TOxIC on 28/05/2019.
//  Copyright © 2019 Saqib. All rights reserved.
//

import Foundation
import NotificationBannerSwift


class Helper: NSObject {
    
    
    // Properties
    
    
    override init() {
        
    }
    
    // MARK: - Show Banner
    
    func showBanner(title: String, subTitle: String, style : BannerStyle) {
        
        let banner = NotificationBanner(title: title, subtitle: subTitle, style: style)
        banner.show()
        
    }
}
