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
    
    // MARK: - IBOutlets
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    // MARK: - IBActions
    
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
    }
}
