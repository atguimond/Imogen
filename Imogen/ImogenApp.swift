//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Abby Guimond on 10/12/22.
//

import SwiftUI

@main
struct ImogenApp: App {
    
    @StateObject var picturesViewModel = PicturesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
