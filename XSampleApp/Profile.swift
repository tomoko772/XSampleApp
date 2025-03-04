//
//  Profile.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/03/04.
//

import Foundation
import RealmSwift

final class Profile: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var imageString: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

