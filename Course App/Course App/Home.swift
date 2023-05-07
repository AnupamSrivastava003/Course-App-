//
//  Home.swift
//  Course App
//
//  Created by SKUBI on 02/04/23.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var showContent = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color("background2").ignoresSafeArea()
            
            HomeView(showProfile: $showProfile, showContent: $showContent)
            .padding(.top, 44)
            .background(
                LinearGradient(colors: [Color("background2"), Color("background1")], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .scaleEffect(showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
            .ignoresSafeArea()
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                        .onEnded{ value in
                            if self.viewState.height > 50 {
                                self.showProfile = false
                            }
                            self.viewState = .zero
                        }
                    )
                    if showContent {
                        BlurView(style: .systemMaterial).ignoresSafeArea()
                        ContentView()
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "xmark")
                                            .frame(width: 36, height: 36)
                                            .foregroundColor(.white)
                                            .background(.black)
                                        .clipShape(Circle())
                            }
                            Spacer()
                        }
                        .offset(x: -16, y:14)
                        .transition(.move(edge: .top))
                        .animation(.spring(), value: true)
                        .onTapGesture {
                            self.showContent = false
                        }
                    }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.colorScheme, .dark)
    }
}

struct AvatarView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        Button {
            self.showProfile.toggle()
        } label: {
            Image("Avatar")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
