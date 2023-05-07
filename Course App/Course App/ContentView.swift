//
//  ContentView.swift
//  Course App
//
//  Created by SKUBI on 31/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var cardView = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .offset(x: 0, y: show ? -200 : 20)
                .animation(.default, value: show)
                
            BackCardView()
                .frame(width: cardView ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -360 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(x: 0, y: cardView ? 90 : 20)
                .scaleEffect(cardView ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 7))
                .rotation3DEffect(Angle(degrees: cardView ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.37), value: show)
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -190 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(x: 0, y: cardView ? 10 : 20)
                .scaleEffect(cardView ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: cardView ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.2), value: show)
            
            CardView()
                .frame(width: cardView ? 400 : 350, height: 220)
                .background(.black)
                .cornerRadius( cardView ? 30 : 20)
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(x: 0, y: cardView ? -100 : 20)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.show.toggle()
                    self.cardView.toggle()
                }
                .gesture(
                    DragGesture().onChanged({ value in
                        self.viewState = value.translation
                        self.show = true
                    })
                    .onEnded({ value in
                        self.viewState = .zero
                        self.show = false
                    })
                )
            
            //Text("\(bottomState.height)").offset(y: -300)
            
            BottomCardView(show: $cardView)
                .offset(x: 0, y: cardView ? 360 : 1000)
                .offset(y: bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1), value: show)
                .gesture(
                    DragGesture().onChanged{ value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                        .onEnded({ value in
                            if bottomState.height > 50 {
                                self.cardView = false
                                self.show = false
                            }
                            if (bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                                self.bottomState.height = -300
                                self.showFull = true
                            } else {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Image("Card1")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
    }
}

struct TitleView: View {
    @State var show = false
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            Image("Background1")
            Spacer()
            
        }
    }
}

struct BottomCardView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(8)
                .opacity(0.2)
                .padding(.top, -7)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .padding(.top)
                .font(.subheadline)
            
            HStack {
                RingView(color1: Color.blue,color2: Color.indigo ,height: 88, width: 88, percent: 72, show: $show)
                    .animation(.easeInOut(duration: 0.3), value: show)
                    .padding(.trailing)
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI").bold()
                    Text("12 of 12 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color("background3"))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                
            }
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .systemThinMaterial))
        .ignoresSafeArea()
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
