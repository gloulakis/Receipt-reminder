//
//  ContentView.swift
//  Receipt reminder
//
//  Created by Georgios Loulakis on 23.11.20.
//

import SwiftUI

let lightGreyColor = Color(red:239.0/255.0,green:243.0/255.0,blue:243.0/255.0)

let user = "Admin"
let pass = "123"


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct LoginView: View {
    @State var username : String=""
    @State var password : String=""
    
    @State var authenticationDidFail:Bool = false
    @State var authenticationDidSucess:Bool = false
    
    @State private var isActive :Bool = false
    
    
    
    var body: some View {
        ZStack{
            NavigationView {
                            VStack {
                                
                                LoginText()
                                SubText()
                                LoginImage()
                                
                                if authenticationDidSucess{
                                    Text("Information is correct")
                                        .font(.headline)
                                        .frame(width: 250, height: 30, alignment: .center)
                                        .background(Color.green)
                                        .cornerRadius(20.0)
                                        .foregroundColor(.white)
                                        .animation(Animation.default)
                                }
                                
                                if authenticationDidFail{
                                    Text("Information is not correct")
                                        .font(.headline)
                                        .frame(width: 250, height: 30, alignment: .center)
                                        .background(Color.red)
                                        .cornerRadius(20.0)
                                        .foregroundColor(.white)
                                        .animation(Animation.default)
                                }
                                
                                UserName(username: $username)
                                Password(password: $password)
                                
                                NavigationLink(
                                    destination: ListOfReceipes(),
                                    isActive: self.$isActive) {
                                        Text("")
                                    }
                                
                                Button ( action: {
                                    if self.username == user && self.password == pass {
                                        self.authenticationDidSucess = true
                                        self.authenticationDidFail=false
                                        self.isActive = true
                                    }else{
                                        self.authenticationDidFail = true
                                        self.authenticationDidSucess = false
                                    }

                                }){
                                    LoginButton()
                                }
                        }
                            .padding()
                    }
                }
        }
    }


    struct NewView: View {
        var body: some View {
            NavigationView {
            NavigationLink(destination: ListOfReceipes()) {
            
          }
        }
      }
    }

    struct LoginImage: View {
        var body: some View {
            Image("AvatarImage")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }


    struct LoginFrameImage: View {
        var body: some View {
            Image("frameimage")
                .resizable()
                
        }
    }


    struct LoginText: View {
        var body: some View {
            Text("Recipes")
                .font(.title)
                .fontWeight(.semibold)
        }
    }
    
    struct SubText: View {
        var body: some View {
            Text("Organizer")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.bottom,20)
        }
    }

    struct LoginButton: View {
        var body: some View {
            Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.black)
                .cornerRadius(35)
                .shadow(radius: 10 )
                .hoverEffect(.lift)
        }
    }

    struct UserName: View {
        @Binding var username: String
        var body: some View {
            TextField("Username",text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5)
                .padding(.bottom,20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
        }
    }

    struct Password: View {
        @Binding var password: String
        var body: some View {
            SecureField("Password",text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5)
                .padding(.bottom,20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
        }
    }
