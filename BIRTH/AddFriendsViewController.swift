//
//  AddFriendsViewController.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/03/06.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import FacebookCore
import FacebookLogin

class AddFriendsViewController: UIViewController {

    @IBOutlet weak var fb_user_id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add() {
        var dict : [String : Any] = [:]
        
        let parameters = [
            "user_id": 0,
            "fb_user_id": self.fb_user_id,
            "name": self.name,
            "birthday": self.birthday
            ] as [String : Any]
        
        request("https://gentle-everglades-56388.herokuapp.com/friends/0", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        
        let alert:UIAlertController = UIAlertController(title: "追加", message: "友達が追加されました！", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style:.default,
                handler: {action in
                    //ボタンが押された時の動作
                    self.dismiss(animated: true, completion: nil) }
        ) )
        
        present(alert, animated: true, completion: nil)
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
