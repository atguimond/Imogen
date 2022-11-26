//
//  ChatView.swift
//  Imogen
//
//  Created by Abby Guimond on 11/25/22.
//
import Foundation
import Combine
import SwiftUI

class ChatHelper : ObservableObject {
    @Published var realTimeMessages : [Message] = []
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
    }
    
    func sendResponse(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
    }
}

struct ChatView: View {
    var initMessage: String = ""
    @State var typingMessage: String = ""
    @State var aiResponse: String = ""
    @ObservedObject var chatHelper = ChatHelper()
    
    init(initMessage: String) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chatHelper.realTimeMessages) {msg in MessageView(currentMessage: msg)
                    }
                }
                HStack{
                    TextField("Search here...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: {
                        sendMessage()
                        
                        Task {
                            await search_api()
                            sendResponse()
                        }
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .foregroundColor(Color(red: 0.13, green: 0.543, blue: 0.647))
                            .font(.system(size: CGFloat(30)))
                    }
                }.frame(minHeight: CGFloat(50)).padding()
            }.navigationBarTitle("Imogen")
                .padding(.bottom)
        }
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.user1))
        typingMessage = ""
    }
    
    func sendResponse() {
        chatHelper.sendResponse(Message(content: aiResponse, user: DataSource.bot))
        aiResponse = ""
    }
    
    func search_api() async {
        
        //this be a dictionary
        let parameters: [String: Any] = ["question": typingMessage]
        
        //this creates the URL
        //TODO: Change this URL to your Jaseci server URL.
        let url = URL(string: "http://localhost:8000/js/walker_run")!
        
        //create the session object
        let session = URLSession.shared
        
        //create the URLRequest object
        var request = URLRequest(url: url)
        
        //add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("token kalsjdfiurheacjnskdjfjkhdfuiesainc", forHTTPHeaderField: "Authorization")
        
        do {
            //convert to Data
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print (error.localizedDescription)
            return
        }
        
        //create dataTask
        let task = await session.dataTask(with: request) {data, response, error in
            if let error = error {
                print ("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            //ensure valid response code
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            //ensure data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
                //create JSON object
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    print(jsonResponse)
                    // handle json response
                    guard let jsonArray = jsonResponse as? [[String: Any]] else {
                          return
                    }
                    guard let aiResponse = jsonArray[0]["response"] as? String else { return }
                    } else {
                        print("data maybe corrupted or in wrong format")
                        throw URLError(.badServerResponse)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(initMessage: "")
    }
}
