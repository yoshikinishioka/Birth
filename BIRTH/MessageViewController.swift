//
//  MessageViewController.swift
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

class MessageViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // インスタンス初期化
        let textField = UITextField()
        
        // サイズ設定
        textField.frame.size.width = self.view.frame.width * 2 / 3
        textField.frame.size.height = 48
        
        // 位置設定
        textField.center.x = self.view.center.x
        textField.center.y = 240
        
        // Delegate を設定
        textField.delegate = self
        
        // プレースホルダー
        textField.placeholder = "誕生日をお祝いしよう！"
        
        // 背景色
        textField.backgroundColor = UIColor(white: 1, alpha: 1)
        
        // 左の余白
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // 改行ボタンの種類を変更
        textField.returnKeyType = .done
        
        // 画面に追加
        self.view.addSubview(textField)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func send() {
        var dict : [String : Any] = [:]
        
        let parameters = [
            "content": "happy birthday",
            "sender_id": 0,
            "receiver_id": 1
            ] as [String : Any]
        
        request("https://gentle-everglades-56388.herokuapp.com/messages", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        
        //AppManager.manager.message =
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /* 以下は UITextFieldDelegate のメソッド */
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("Clear")
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
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
