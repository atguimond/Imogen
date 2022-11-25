//
//  PicturesListView.swift
//  Imogen
//
//  Created by Abby Guimond on 11/25/2022.
//

import SwiftUI

class PicturesViewModel: ObservableObject {
  @Published var pictures: [Picture] = Picture.samples
}

struct PicturesListView: View {
  @ObservedObject var picturesViewModel: PicturesViewModel
  
  var body: some View {
    List {
      ForEach(picturesViewModel.pictures) { picture in
        NavigationLink(destination: Text("\(picture.title)")) {
          PictureRowView(picture: picture)
        }
      }
    }
  }
}

struct PicturesListView_Previews: PreviewProvider {
  static let picturesViewModel = PicturesViewModel()
  
  static var previews: some View {
    NavigationView {
      PicturesListView(picturesViewModel: picturesViewModel)
        .navigationTitle("Pictures")
        .preferredColorScheme(.light)
    }
  }
}


