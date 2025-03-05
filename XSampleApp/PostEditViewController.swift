//
//  PostEditViewController.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/24.
//

import UIKit

/// ポスト編集画面
class PostEditViewController: UIViewController {
    
    // MARK: -　Properties
    
    private let placeholderText = "いまどうしてる？"
    /// RealmManagerのインスタンス
    private let realmManager = RealmManager.shared
    
    // MARK: - IBOutlets
    
    ///　プレースホルダー
    @IBOutlet private weak var placeholderTextView: UITextView!
    /// 自分のプロフイール画像
    @IBOutlet private weak var userImageView: UIImageView!
    /// 名前テキストフィールド
    @IBOutlet private weak var nameTextField: UITextField!
    /// テキストビュー
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBarButtonItems()
        configureProfileImage()
        configureTextView()
    }
    
    // MARK: - Other Methods
    
    private func configureTextView() {
        // プレースホルダーテキストを設定
        placeholderTextView.text = placeholderText
        placeholderTextView.textColor = UIColor.lightGray
        
        // デリゲートを設定
        placeholderTextView.delegate = self
    }
    
    private func configureBarButtonItems() {
        let cancelButton = UIBarButtonItem(title:"キャンセル",
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapCancelButtonButton))
        cancelButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = cancelButton
        
        let postButton = UIBarButtonItem(customView: configurePostButton( ))
        navigationItem.rightBarButtonItem = postButton
    }
    
    /// キャンセルパーボタンをタップ
    @objc func didTapCancelButtonButton()  {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    private func configurePostButton() -> UIButton  {
        let postButton = UIButton (type: .custom)
        postButton.setTitle("ポスト", for: .normal) // ボタンタイトルを設定
        postButton.titleLabel?.font = UIFont.systemFont(ofSize: 14) // フォントサイズを設定
        postButton.backgroundColor = UIColor(hex: "#109BF8")//背景色を設定
        postButton.layer.cornerRadius=16//角丸を設定
        postButton.frame = CGRect(x: 0, y: 0, width: 70, height: 32) // サイズを設定
        
        // customButtonにアクションを追加
        postButton.addTarget (self,
                              action: #selector(didTapPostButton) ,
                              for: .touchUpInside)
        return postButton
    }
    
    /// 「ポスト」バーボタンをタップ
    @objc private func didTapPostButton() {
        // ボタンがタップされたときの処理をここに記述
    }
    
    ///プロフィール画像の設定
    private func configureProfileImage() {
        if let profile = realmManager.getProfile(),
           let imageString = profile.imageString,
           let imageData = Data(base64Encoded: imageString),
           let image = UIImage(data: imageData) {
            userImageView.image = image
        } else {
            userImageView.image = UIImage(systemName: "person")
        }
    }
}

// MARK: - Extensions

extension PostEditViewController: UITextViewDelegate {
    
    /// テキストが編集されたときに呼ばれる
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText && textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    /// テキストフィールドがフォーカスを失ったときに呼ばれる
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
    
    /// textview文字数制限
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        let textCount = textView.text.count + (text.count - range.length)
        return checkCharacterLimit(textCount: textCount)
    }
    
    /// 140文字以下かどうかをチェック
    private func checkCharacterLimit(textCount: Int) -> Bool {
        // 140文字以下の場合
        if textCount <= 140 {
            return true
        } else {
            showCharacterLimitAlert()
            return false
        }
    }
    
    /// アラートを表示
    private func showCharacterLimitAlert() {
        let alert = UIAlertController(title: "文字数制限オーバー",
                                      message: "ツイートは140文字以内にしてください。",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}


