//
//  User.swift
//  Imogen
//
//  Created by Abby Guimond on 11/25/22.
//

import Foundation

struct User: Hashable {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
