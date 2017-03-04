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
    
    let name = ["はるふ", "さくちゃん", "あかさん", "ゆうくん", "りょうさん", "まるさん", "小森さん"]
    
    let birthday = ["2/15", "2/15", "2/15", "2/15", "2/15", "2/15", "2/15"]
    
    //var recentlyNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        //recentlyNameArray = ["facebookから友達の情報を取得", "facebookから友達の情報を取得", "facebookから友達の情報を取得", "facebookから友達の情報を取得"]
        
        table.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Recently")
//        
//        cell?.textLabel?.text = recentlyNameArray[indexPath.row]
//        
//        return cell!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recently") as! CustomTableViewCell
        cell.nameLabel.text = name[indexPath.row]
        cell.birthdayLabel.text = birthday[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //NSLog("%@が選ばれました", recentlyNameArray[indexPath.row])
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
