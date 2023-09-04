//
//  MUser.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 21.07.2023.
//

import UIKit
import FirebaseFirestore

struct MUser: Hashable, Decodable {
    var username: String
    var email: String
    var description: String
    var sex: String
    var avatarStringURL: String
    var id: String
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let username = data["username"] as? String else { return nil }
        guard let email = data["email"] as? String else { return nil }
        guard let description = data["description"] as? String else { return nil }
        guard let sex = data["sex"] as? String else { return nil }
        guard let avatarStringURL = data["avatarStringURL"] as? String else { return nil }
        guard let id = data["uid"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.description = description
        self.sex = sex
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let username = data["username"] as? String else { return nil }
        guard let email = data["email"] as? String else { return nil }
        guard let description = data["description"] as? String else { return nil }
        guard let sex = data["sex"] as? String else { return nil }
        guard let avatarStringURL = data["avatarStringURL"] as? String else { return nil }
        guard let id = data["uid"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.description = description
        self.sex = sex
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    init(username: String, email: String, description: String, sex: String, avatarStringURL: String, id: String) {
        self.username = username
        self.email = email
        self.description = description
        self.sex = sex
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    var representation: [String: Any] {
        var rep = ["username": username]
        rep["email"] = email
        rep["description"] = description
        rep["sex"] = sex
        rep["avatarStringURL"] = avatarStringURL
        rep["uid"] = id
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
