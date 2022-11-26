//
//  ContentView.swift
//  Landmarks
//
//  Created by Abby Guimond on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    @State public var searchParams: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 8.0) {
                Spacer().frame(minWidth: 0, minHeight: 0).layoutPriority(-1)
                    .frame(height: 60.0, alignment: .bottom)
                    .layoutPriority(0.0)
                
                Text("Imogen")
                    .font(.title.bold())
                    .foregroundColor(Color(hue: 0.5330586751302083, saturation: 0.7961176554361978, brightness: 0.647198994954427, opacity: 1.0))
                    .multilineTextAlignment(.center)
                
                    .padding(
                        EdgeInsets(
                            top: CGFloat(25.0),
                            leading: CGFloat(25.0),
                            bottom: CGFloat(25.0),
                            trailing: CGFloat(25.0)
                        )
                    )
                
                Spacer().frame(minWidth: 0, minHeight: 0).layoutPriority(-1)
                
                Image("icon")
                    .resizable()
                    .frame(
                        width: 250.0,
                        height: 250.0
                    )
                
                Spacer().frame(minWidth: 0, minHeight: 0).layoutPriority(-1)
                
                Text("What image can I help you find today?")
                    .font(.title2)
                    .foregroundColor(Color(uiColor: .label))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(
                        EdgeInsets(
                            top: CGFloat(1.0),
                            leading: CGFloat(50.0),
                            bottom: CGFloat(25.0),
                            trailing: CGFloat(49.0)
                        )
                    )
                Spacer(minLength: 50)
                HStack(alignment: .center, spacing: 0) {
                    TextField(text: $searchParams, prompt: Text("Search here...")) {
                    }
                    .keyboardType(.alphabet)
                    
                    NavigationLink(destination: ChatView(initMessage: searchParams)) {
                        Image(systemName: "arrow.up.circle.fill")
                            .foregroundColor(Color(red: 0.13, green: 0.543, blue: 0.647))
                            .font(.system(size: CGFloat(30)))
                    }
                }
                .padding(10.0)
                .frame(width: 350.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 0.13, green: 0.543, blue: 0.647), lineWidth: 4)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(searchParams: "")
    }
}
