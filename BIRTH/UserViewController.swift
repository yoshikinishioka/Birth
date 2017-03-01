//
//  UserViewController.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/02/28.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class UserViewController: UIViewController {

    
    @IBOutlet var fbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserInfo (){
        //Facebookのユーザー情報を取得する処理
        GraphRequest(graphPath: "me", parameters: ["fields": "name, friends"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: GraphAPIVersion.defaultVersion).start({
            response, result in
            switch result {
            case .success(let response) :
                print("response:\(response)")
                break
            case .failed(let error):
                print("error:\(error.localizedDescription)")
            }
        })
    }
    
    
    @IBAction func fbLogout() {
        LoginManager().logOut()
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
