//
//  AppManager.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/03/02.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import FacebookCore
import FacebookLogin

class AppManager {
    static let manager = AppManager()
    var user: User!
    var message: Message!
}
