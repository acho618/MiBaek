//
//  ContentView.swift
//  MiBaek
//
//  Created by Amy Cho on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                Circle()
                    .scale(1.6)
                    .foregroundColor(.white.opacity(3.0))
                VStack{
                    //Image(.miBaek)
                      //  .resizable()
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                        // Authenticate the user
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green.opacity(0.8))
                    .cornerRadius(10)
                    
                    //navigation link that will send the user to the right place once they login correctly
                    NavigationLink(destination: Text("Welcome @\(username)"), isActive: $showingLoginScreen ){
                        EmptyView()
                    }
                }
            }
        } .navigationBarHidden(true)
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "aj2024" {
            wrongUsername = 0
            if password.lowercased() == "abc123"{
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else{
            wrongUsername = 2
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
