//
//  RealmManager.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/03/04.
//

import RealmSwift

/// Realmの管理クラス
final class RealmManager {
    
    // MARK: - Type Properties
    
    static let shared = RealmManager()
    
    // MARK: - Properties
    
    private let realm = try! Realm()
    
    // MARK: - Other Methods
    
    /// プロフィールを取得
    func getProfile() -> Profile? {
        return realm.objects(Profile.self).first
    }
    
    /// プロフィールを保存
    func saveProfile(imageString: String) {
        let profile = Profile()
        profile.imageString = imageString
        
        try! realm.write {
            realm.add(profile, update: .modified)
        }
    }
    
    /// 投稿を取得
    func getPosts() -> Results<Post> {
        return realm.objects(Post.self).sorted(byKeyPath: "date", ascending: false)
    }
    
    /// 投稿を保存
    func savePost(imageString: String, name: String, body: String) {
        let post = Post()
        post.imageString = imageString
        post.name = name
        post.body = body
        
        try! realm.write {
            realm.add(post)
        }
    }
}
