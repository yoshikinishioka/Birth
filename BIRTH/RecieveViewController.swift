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
    
    var nameArray: [String] = []
    var contentArray: [String] = []
    
//    let name = ["ジャスティン", "きゃあ。", "ばなな", "けいちゃん", "べいべー", "パーカー", "みあきち"]
//    
//    let content = ["ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!", "ダイバーHappy Birthday!!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getReceives()
        
        table.dataSource = self
        
        table.delegate = self
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Happy_Birthday_To_You", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath as URL)
        audioPlayer.play()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getReceives() {
        Alamofire.request("https://gentle-everglades-56388.herokuapp.com/messages/receive/1")
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach { (_, json) in
//                    self.nameArray.append(json["name"].string!)
                    self.contentArray.append(json["content"].string!)
                }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Receive") as! CustomTableViewCell
        
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.contentLabel.text = contentArray[indexPath.row]
        
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
