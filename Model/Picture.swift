//
//  Picture.swift
//  Imogen
//
//  Created by Abby Guimond on 11/25/22.
//

import Foundation

struct Picture: Hashable, Identifiable {
  var id = UUID()
  var title: String
  var similarity: Float
  var url: String = ""
}

extension Picture {
  var coverPictureName: String { return url }
}

extension Picture {
  static let samples = [
    Picture(title: "Changer", similarity: 1.0),
    Picture(title: "SwiftUI for Absolute Beginners", similarity: 1.0),
    Picture(title: "Why we sleep", similarity: 1.0),
    Picture(title: "The Hitchhiker's Guide to the Galaxy", similarity: 1.0)
  ]
}
