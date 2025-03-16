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
    @IBOutlet private weak var userImageView: UIImageView!
    ///ユーザー名ラベル
    @IBOutlet private weak var userNameLabel: UILabel!
    ///本文ラベル
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func configure(imageString: String, name: String, body: String) {
        if let imageData = Data(base64Encoded: imageString),
           let image = UIImage(data: imageData) {
            self.userImageView.image = image
        } else {
            self.userImageView.image = UIImage(systemName: "person.circle.fill")
        }
        self.userNameLabel.text = name
        self.bodyLabel.text = body
    }
}
