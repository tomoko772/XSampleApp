//
//  HomeTableViewCell.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/17.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    ///ユーザーイメージビュー
    @IBOutlet weak var userImageView: UIImageView!
    ///ユーザー名ラベル
    @IBOutlet weak var userNameLabel: UILabel!
    ///本文ラベル
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
