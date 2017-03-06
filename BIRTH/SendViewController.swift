//
//  SendViewController.swift
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

class SendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var timer: Timer = Timer()
    
    var receiverNameArray: [String] = []
    var contentArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.getSends),
            userInfo: nil,
            repeats: true
        )
        
        table.dataSource = self
        
        table.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func getSends() {
        request("https://gentle-everglades-56388.herokuapp.com/messages/send/0", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach { (_, json) in
                    if !zip(self.receiverNameArray, self.contentArray).contains(where: { $0 == (json["receiver_name"].string!, json["content"].string!) }) {
                    self.receiverNameArray.append(json["receiver_name"].string!)
                    self.contentArray.append(json["content"].string!)
                    }
                }
                print(self.contentArray)
                self.table.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return sendNameArray.count
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Send") as! CustomTableViewCell
        
        cell.setSend(receiverName: receiverNameArray[indexPath.row], content: contentArray[indexPath.row])
        
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
