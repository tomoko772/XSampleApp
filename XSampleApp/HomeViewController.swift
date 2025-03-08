//
//  HomeViewController.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/13.
//

import UIKit

/// Home画面
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let cells: [Home] = [
        Home(
            imageString: "image1",
            name: "山田太郎",
            body: "This is the body of cell 1"
        ),
        Home(
            imageString: "image2",
            name: "佐藤花子",
            body: "This is the body of cell 2"
        ),
        Home(
            imageString: "image3",
            name: "吉田沙織",
            body: "This is the body of cell 3"
        )
    ]
    /// RealmManagerのインスタンス
    private let realmManager = RealmManager()
    
    // MARK: - IBOutlets
    
    /// ポストボタンをタップ
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
    }
    
    // MARK: - IBActions
    
    /// ポストボタンをタップ
    @IBAction func didTapPostButton(_ sender: Any) {
        let vc = PostEditViewController()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    // MARK: - Other Methods
    
    private func configureNavigationBar() {
        
        // 画像ビューを作成
        let imageView = UIImageView(image: UIImage(named: "ic_x_logo"))
        imageView.contentMode = .scaleAspectFit
        
        // 画像のサイズを適切に設定
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 24))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        
        // ナビゲーションアイテムのタイトルビューに設定
        self.navigationItem.titleView = titleView
        
        // 左のバーボタンアイテムに画像を設定する
        if let profile = realmManager.getProfile(),
           let imageString = profile.imageString,
           let imageData = Data(base64Encoded: imageString),
           let image = UIImage(data: imageData) {
            // 画像のサイズを32x32にリサイズ
            let circularImage = image.makeCircularImage(image: image, size: CGSize(width: 32, height: 32))
            // 画像を使ってUIBarButtonItemを作成する
            let leftBarButtonItem = UIBarButtonItem(image: circularImage?.withRenderingMode(.alwaysOriginal),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(didTapLeftBarButton))
            // leftBarButtonItemに設定する
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        } else {
            // 画像を設定していない場合
            let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(didTapLeftBarButton))
            // leftBarButtonItemに設定する
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    
    /// 左のバーボタンアイテムがタップされた
    @objc func didTapLeftBarButton() {
        // イメージピッカーを表示
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // カスタムセル
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! HomeTableViewCell
        cell.configure(imageString: cells[indexPath.row].imageString,
                       name: cells[indexPath.row].name,
                       body: cells[indexPath.row].body)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    /// セルをタップされた時のメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされたときに実行したいアクションをここに追加します
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension HomeViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage,
           let imageData = image.jpegData(compressionQuality: 0.8) {
            let imageString = imageData.base64EncodedString()
            realmManager.saveProfile(imageString: imageString)
            setupProfileImage(imageData: imageData)
        }
        picker.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    /// プロフィール画像にセット
    private func setupProfileImage(imageData: Data) {
        if let image = UIImage(data: imageData) {
            // 画像のサイズを32x32にリサイズ
            let circularImage = image.makeCircularImage(image: image, size: CGSize(width: 32, height: 32))
            // 画像を使ってUIBarButtonItemを作成する
            let leftBarButtonItem = UIBarButtonItem(image: circularImage?.withRenderingMode(.alwaysOriginal),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(didTapLeftBarButton))
            // leftBarButtonItemに設定する
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
}
