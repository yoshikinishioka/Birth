//
//  RecieveViewController.swift
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

class RecieveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var receiveNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
 
// alamofireのサンプル練習コード
//        title = "Receive"
//        table.frame = view.frame
//        view.addSubview(table)
//        
//        getReceives()
        
        table.dataSource = self
        
        receiveNameArray = ["facebookから友達の情報を取得", "facebookから友達の情報を取得", "facebookから友達の情報を取得", "facebookから友達の情報を取得"]
        
        table.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
//   // alamofireのサンプル練習コード
//    func getReceives() {
//        Alamofire.request("https://qiita.com/api/v2/items")
//            .responseJSON { response in
//                guard let object = response.result.value else {
//                    return
//                }
//                
//                let json = JSON(object)
//                json.forEach { (_, json) in
//                    print(json["title"].string)
//                }
//                
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Receive")
        
        cell?.textLabel?.text = receiveNameArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("%@が選ばれました", receiveNameArray[indexPath.row])
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
