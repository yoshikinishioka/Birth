//
//  RecentlyViewController.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/02/28.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import FacebookCore
import FacebookLogin

class RecentlyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var nameArray: [String] = []
    var birthdayArray: [String] = []
    
//    let name = ["はるふ", "さくちゃん", "あかさん", "ゆうくん", "りょうさん", "まるさん", "小森さん"]
//    let birthday = ["2/15", "2/15", "2/15", "2/15", "2/15", "2/15", "2/15"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        getRecentlies()
        
        // Do any additional setup after loading the view.
    }
    
    func getRecentlies() {
        request("https://gentle-everglades-56388.herokuapp.com/users/0/friends", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach { (_, json) in
                    self.nameArray.append(json["name"].string!)
                    self.birthdayArray.append(json["birthday"].string!)
                }
                print(self.nameArray, self.birthdayArray)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recently") as! CustomTableViewCell
        cell.nameLabel.text = self.nameArray[indexPath.row]
        cell.birthdayLabel.text = self.birthdayArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
