//
//  HomeTableViewCell.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/17.
//

import UIKit

///ホーム画面のセル
class HomeTableViewCell: UITableViewCell {
    
    ///ユーザーイメージビュー
    @IBOutlet weak var userImageView: UIImageView!
    ///ユーザー名ラベル
    @IBOutlet weak var userNameLabel: UILabel!
    ///本文ラベル
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configure(imageString: String, name: String, body: String) {
        self.userImageView.image = UIImage (named: imageString)
        self.userNameLabel.text = name
        self.bodyLabel.text = body
    }
}
