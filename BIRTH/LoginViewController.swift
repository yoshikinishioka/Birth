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
import FBSDKShareKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBAction func login(_ sender: UIButton) {
        LoginManager().logIn([.email], viewController: self, completion: {
            result in
            switch result {
            case let .success( permission, declinePemisson, token):
                print("token:\(token),\(permission),\(declinePemisson)")
                self.performSegue(withIdentifier: "showMain", sender: nil)
            case let .failed(error):
                print("error:\(error)")
            case .cancelled:
                print("cancelled")
            }
        })
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
