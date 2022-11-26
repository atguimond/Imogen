//
//  Message.swift
//  Imogen
//
//  Created by Abby Guimond on 11/25/22.
//

import Foundation

struct Message: Hashable, Identifiable {
    var content: String
    var user: User
    var id = UUID()
}

struct DataSource {
    static let bot = User(name: "Imogen", avatar: "icon")
    //TODO: give user icon
    static var user1 = User(name: "User", avatar: "myAvatar", isCurrentUser: true)
}
