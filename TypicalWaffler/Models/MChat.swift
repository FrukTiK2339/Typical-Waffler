//
//  MChat.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 21.07.2023.
//

import UIKit



struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
