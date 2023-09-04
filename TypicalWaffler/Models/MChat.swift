//
//  MChat.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 21.07.2023.
//

import UIKit
import FirebaseFirestore

struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendImageString: String
    var lastMessage: String
    var friendId: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
    
    var representation: [String: Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendImageString"] = friendImageString
        rep["lastMessage"] = lastMessage
        rep["friendId"] = friendId
        return rep
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let friendUsername = data["friendUsername"] as? String,
        let friendImageString = data["friendImageString"] as? String,
        let lastMessage = data["lastMessage"] as? String,
        let friendId = data["friendId"] as? String else { return nil }
        
        self.friendId = friendId
        self.friendUsername = friendUsername
        self.friendImageString = friendImageString
        self.lastMessage = lastMessage

    }
    
    init(friendUsername: String, friendImageString: String, lastMessage: String, friendId: String) {
        self.friendId = friendId
        self.friendUsername = friendUsername
        self.friendImageString = friendImageString
        self.lastMessage = lastMessage

    }
}
