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
import FacebookCore
import FacebookLogin
import AVFoundation

class RecieveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var audioPlayer: AVAudioPlayer!
    
    //var nameArray: [String] = []
    var contentArray: [String] = []
    
//    let name = ["ジャスティン", "きゃあ。", "ばなな", "けいちゃん", "べいべー", "パーカー", "みあきち"]
//    
//    let content = ["ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getReceives()
        
        table.dataSource = self
        
        table.delegate = self
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: "Happy_Birthday_To_You", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer?.play()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getReceives() {

        request("https://gentle-everglades-56388.herokuapp.com/messages/receive/1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach { (_, json) in
                    self.contentArray.append(json["content"].string!)
                }
                print(self.contentArray)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Receive") as! CustomTableViewCell
        
        //cell.nameLabel.text = self.nameArray[indexPath.row]
        cell.contentLabel.text = self.contentArray[indexPath.row]
        
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
