//
//  MMessage.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 04.09.2023.
//

import UIKit
import FirebaseFirestore

struct MMessage: Hashable {
    let content: String
    let senderId: String
    let senderUsername: String
    let sentDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.content = content
        self.senderId = user.id
        self.senderUsername = user.username
        self.sentDate = Date()
        self.id = nil
    }
    
    var representation: [String: Any] {
        var rep: [String: Any] = [
            "created" : sentDate,
            "senderId": senderId,
            "senderName": senderUsername,
            "content": content]
        return rep
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let content = data["content"] as? String else { return nil }
        guard let senderId = data["senderId"] as? String else { return nil }
        guard let senderUsername = data["senderName"] as? String else { return nil }
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        
        self.sentDate = sentDate.dateValue()
        self.senderId = senderId
        self.senderUsername = senderUsername
        self.content = content
        self.id = document.documentID
    }
}
