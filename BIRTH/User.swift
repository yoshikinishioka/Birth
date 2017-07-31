//
//  User.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/03/02.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON
import FacebookCore
import FacebookLogin

class User {
    var fb_user_id: String!
    var birhday: Date!
    var name: String!
}
