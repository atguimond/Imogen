import SwiftUI

//struct PicturesListScreen: View {
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: true) {
//            VStack(spacing: 0) {
//                Text("Image Finder")
//                    .font(.title.bold())
//                    .foregroundColor(Color(hue: 0.5330586751302083, saturation: 0.7961176554361978, brightness: 0.647198994954427, opacity: 1.0))
//                    .multilineTextAlignment(.leading)
//            }
//        }
//    }
//}

struct PicturesListScreen: View {
    @StateObject var picturesViewModel = PicturesViewModel()
    var body: some View {
        NavigationView {
            PicturesListView(picturesViewModel: picturesViewModel)
                .navigationTitle("Image Finder")
        }
    }
}

struct PicturesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PicturesListScreen()
    }
}
