//
//  PostEditViewController.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/24.
//

import UIKit

///ポスト編集画面
class PostEditViewController: UIViewController {
    
    ///自分のプロフイール画像
    @IBOutlet private weak var userImageView: UIView!
    ///名前テキストフィールド
    @IBOutlet private weak var nameTextField: UITextField!
    ///テキストビュー
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBarButtonItems()
    }
    
    // MARK: - Other Methods
    
    private func configureBarButtonItems( ) {
        let cancelButton = UIBarButtonItem(title:"キャンセル",
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapCancelButtonButton))
        cancelButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = cancelButton
        
        let postButton = UIBarButtonItem(customView: configurePostButton( ))
        navigationItem.rightBarButtonItem = postButton
    }
    
    ///キャンセルパーボタンをタップ
    @objc func didTapCancelButtonButton( )  {
            // 前の画面に戻る
            dismiss(animated: true, completion: nil)
        }
    }
    
    private func configurePostButton() -> UIButton  {
        let postButton = UIButton (type: .custom)
        postButton.setTitle("ポスト", for: .normal) //ボタンタイトルを設定
        postButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)//フォントサイズを設定
        postButton.backgroundColor = UIColor(hex: "#109BF8")//背景色を設定
        postButton.layer.cornerRadius=16//角丸を設定
        postButton.frame = CGRect(x: 0, y: 0, width: 70, height: 32)//サイズを設定
        
        // customButtonにアクションを追加
        postButton.addTarget (self,
                              action: #selector(didTapPostButton) ,
                              for: .touchUpInside)
        return postButton
    }
    
    ///「ポスト」バーボタンをタップ
    @objc private func didTapPostButton( ) {
        //ボタンがタップされたときの処理をここに記述
    }
}
