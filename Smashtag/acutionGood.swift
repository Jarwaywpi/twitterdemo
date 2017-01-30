//
//  acutionGood.swift
//  Smashtag
//
//  Created by Jarway on 2016/11/14.
//  Copyright © 2016年 Jarway. All rights reserved.
//

import Foundation

class acutionGood {
    var acutionGoods = [Array<auctionGood>]()
    
    init() {
    }
    
    func addNewGood(user: String, text: String, created: Date, highbit: Int, oneShot: Int) {
        acutionGoods.append([auctionGood(user: user, text: text, created: Date(), highbit: highbit, oneShot: oneShot)])
    }
    
}

struct auctionGood {
    var Image: URL = NSURL(string: "https://pbs.twimg.com/profile_images/798191877614772225/d1bHkbsj_normal.jpg") as! URL
    var user: String
    var text: String
    var created: Date
    var highbit: Int
    var oneShot: Int
    
    init (user: String, text: String, created: Date, highbit: Int, oneShot: Int) {
        self.user = user
        self.text = text
        self.created = created
        self.highbit = highbit
        self.oneShot = oneShot
    }
}
