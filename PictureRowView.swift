//
//  PictureRowView.swift
//  PictureShelf
//
//  Created by Abby Guimond on 11.25.22.
//

import SwiftUI

struct PictureRowView: View {
  var picture: Picture
  
  fileprivate func detailsLabel(_ text: String) -> Text {
    return Text(text)
      .font(.subheadline)
  }
  
//  var titleLabel: some View {
//    Text(picture.title)
//      .font(.headline)
//  }
  
  var body: some View {
      Image(picture.coverPictureName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 90)
      Spacer()
    }
  }

struct PictureRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
        PictureRowView(picture: Picture.samples[0])
        .previewLayout(.sizeThatFits)
        PictureRowView(picture: Picture.samples[0])
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
  }
}
