//
//  Post.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/03/14.
//

import Foundation
import RealmSwift

/// ポストデータのモデル
final class Post: Object {
    /// データを一意に識別するための識別子
    @Persisted var id: String = UUID().uuidString
    /// 画像
    @Persisted var imageString: String = ""
    /// ポストした人の名前
    @Persisted var name: String = ""
    /// ポストの文章
    @Persisted var body: String = ""
    /// 日付
    @Persisted var date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
