//
//  CustomTableViewCell.swift
//  BIRTH
//
//  Created by 西岡佳樹 on 2017/03/03.
//  Copyright © 2017年 Yoshiki Nishioka. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRecentlies(name: String, birthday: String) {
        nameLabel.text = name
        birthdayLabel.text = birthday
    }
    
    func setReceive(senderName: String, content: String) {
        nameLabel.text = senderName
        contentLabel.text = content
    }
    
    func setSend(receiverName: String, content: String) {
        nameLabel.text = receiverName
        contentLabel.text = content
    }

}
