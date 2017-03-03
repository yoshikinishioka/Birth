//
//  loginViewController.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/02/27.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import FacebookCore
import FacebookLogin


class LoginViewController: UIViewController {
    
    var dict : [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let loginButton = LoginButton(readPermissions: [.publicProfile, .email, .userFriends])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
//        loginButton.addTar
//         Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Facebook Login
    
    
    func isLoggedInWithFacebook() -> Bool {
        let loggedIn = AccessToken.current != nil
        return loggedIn
    }
    
    func getUserInfo() {
        var dict : [String : Any] = [:]
        
        let parameters = [
            "fb_user_id": 0,
            "birthday": Date(),
            "name": "yoshiki"
        ] as [String : Any]
        request("https://gentle-everglades-56388.herokuapp.com/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        
        // AppManager.manager.user =
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        
        LoginManager().logIn([.email, .publicProfile, .userFriends], viewController: self, completion: {
            result in
            switch result {
            case let .success( permission, declinePemisson, token):
                print("token:\(token),\(permission),\(declinePemisson)")
                self.performSegue(withIdentifier: "showMain", sender: nil) //segue をコードで動かす
                self.getFBUserData()
                let parameters = [
                    "fb_user_id": self.dict["id"],
                    "birthday": self.dict["birthday"],
                    "name": self.dict["name"]
                ]
                request("https://gentle-everglades-56388.herokuapp.com/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
//                Alamofire.request(.POST, "https://gentle-everglades-56388.herokuapp.com/login", parameters: parameters)
                
//                self.getFBFriendsData()
//                let parameters2 = [
//                    "fb_user_id": dict2["id"],
//                    "birthday": dict2["birthday"],
//                    "name": dict2["name"]
//                ]
//                Alamofire.request(.POST, "https://gentle-everglades-56388.herokuapp.com/register_friends", parameters2: parameters)
//                self.friendsList()
                
            case let .failed(error):
                print("error:\(error)")
            case .cancelled:
                print("cancelled")
            }
        })
        
    }

    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, birthday, age_range, first_name, last_name, link, gender, locale, timezone, updated_time, verified"]).start(completionHandler: { (connection, result, error) -> Void in
                if error == nil {
                    self.dict = result as! [String : Any]
                    print(result!)
                    print(self.dict)
                } else {
                    print("error me", error!)
                }
            })
        }
        
//        ["AaJlsuvWJoVGM9Z1YauSu9TNycKtD-E2gMQz2lRXsQJNBLL7hsO9Imyad6Ej67LPyA0TpEeoi7V8JxSgGt3_VQL-3gSiAAL7jChEWTBpqe-ERg",
//         "AaJ8xVX59gLZAoKsCmgA7Hv3gS_uEvZc8r1sVPMi3fztKpRo4dRI0Yv9w_3tS2yS2bnh4t1oQSvqcKvfEYBmy7LRGWNkB2nlEAum_o4sRv5MHQ",
//         "AaLrlO0Adp_6iPv_rOkVX1DiUMVrcfIg0ZkNWu_irbhc0hS9vnMR6VZ4-XswobhJVJ6mD_9lSILn6JB1nHcXnl95FUtoSclpiDPB-UYauJnqXQ",
//         "AaKwjg6OPeauk8_Up3ruyihYHcKIEiS6Dka-GDwBOphBmNB4HNNetyP6L86cxkbHDVQ3Wc43XJp-2k5uRmAsNpfu9FLnEJftq0GGgtT_RBm-EA",
//         "AaJqaDf2pPJvy2r-Q3kin3z6661Rfias9RClr8C4ArX3oigBA7U-MkvOZrVXGJXHM8Vvl5qqRrOs9jUARkY78EBGGk4ixZE4CF_FtGNPIqMkdw"].forEach { id in
//            FBSDKGraphRequest(graphPath: id, parameters: ["fields": "id, name, birthday, age_range, first_name, last_name, link, gender, locale, timezone, updated_time, verified"]).start(completionHandler: { (connection, result, error) -> Void in
//                if error == nil {
//                    self.dict = result as! [String : Any]
//                    print(result!)
//                    print(self.dict)
//                } else {
//                    print("error me", error!)
//                }
//            })
//        }
    }
//    
//    func friendsList() {
//        FBSDKGraphRequest(graphPath: "me/taggable_friends", parameters: ["fields": "id,name"]).start( completionHandler: { (connection, result, error) -> Void in
//            
//            if ((error) != nil)
//            {
//                // Process error
//                print("Error: \(error)")
//                return
//            } else {
//                print(result)
//                print(JSON(result!)["data"].array ?? [])
//            }
    
            
//            let summary = result.valueForKey("summary") as! NSDictionary
//            let counts = summary.valueForKey("total_count") as! NSNumber
//            
//            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me/taggable_friends", parameters: ["fields": "id, name, birthday", "limit": "\(counts)"])
//            
//            graphRequest.start( completionHandler: { (connection, result, error) -> Void in
//                
//                if ((error) != nil)
//                {
//                    // Process error
//                    print("Error: \(error)")
//                    return
//                }
//                else
//                {
//                    let friends = result.valueForKey("data") as! NSArray
//                    var count = 1
//                    if let array = friends as? [NSDictionary] {
//                        for friend : NSDictionary in array {
//                            let name = friend.valueForKey("name") as! NSString
//                            print("\(count) \(name)")
//                            count++
//                        }
//                    }
//                }       
//            })
//        })
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
