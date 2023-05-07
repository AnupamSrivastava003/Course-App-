//
//  HomeView.swift
//  Course App
//
//  Created by SKUBI on 02/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView() {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.largeTitle)
                    .bold()
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button {
                        self.showUpdate.toggle()
                    } label: {
                        Image(systemName: "bell")
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.primary)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }

                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .onTapGesture {
                            self.showContent = true
                        }
                }
                
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sectionData) {section in
                            GeometryReader { geometry in
                                SectionView(section: section)
                                    .rotation3DEffect(Angle(degrees:
                                                                geometry.frame(in: .global).minX   / -20
                                                           ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                        .padding(5)
                        .padding(.bottom, 60)
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Courses")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding(.leading)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 26)).bold()
                    .foregroundColor(.white)
                    .frame(width: 145,alignment: .leading)
                Spacer()
                Image(section.logo)
            }
            //.padding(.horizontal)
            
            Text(section.subtitle.uppercased())
                .foregroundColor(.white).opacity(0.7)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            section.image
                .resizable()
                .scaledToFit()
        }
        .padding(.top)
        .padding(.horizontal)
        .frame(width: width, height: height)
        .background(section.bgcolor)
        .cornerRadius(30)
        .shadow(color: section.bgcolor.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var logo: String
    var image: Image
    var bgcolor: Color
}

let sectionData = [
    Section(id: UUID(), title: "Prototype design in SwiftUI", subtitle: "18 Sections", logo: "Logo1", image: Image("Card1"), bgcolor: Color("card1")),
    Section(id: UUID(), title: "Typography in SwiftUI", subtitle: "23 Sections", logo: "Logo2", image: Image("Card2"), bgcolor: Color("card3")),
    Section(id: UUID(), title: "Advanced Webflow", subtitle: "28 Sections", logo: "Logo3", image: Image("Card3"), bgcolor: Color("card2")),
    Section(id: UUID(), title: "UI UX designing using canva", subtitle: "15 Sections", logo: "Logo1", image: Image("Card4"), bgcolor: Color("card4")),
    Section(id: UUID(), title: "Sketch for SwiftUI", subtitle: "11 Sections", logo: "Logo1", image: Image("Card5"), bgcolor: Color("card1"))
]

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 18) {
            HStack {
                RingView(color1: .blue,color2: .purple, height: 44, width: 44, percent: 34, show: .constant(true))
                VStack (alignment: .leading, spacing: 4) {
                    Text("6 mins left")
                        .font(.subheadline)
                        .bold()
                    Text("Watched 10 mins today")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack {
                RingView(color1: .pink,color2: .purple, height: 34, width: 34, percent: 34, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack {
                RingView(color1: .yellow,color2: .pink, height: 34, width: 34, percent: 34, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
        }
        .padding(.bottom, 30)
        .padding(.horizontal)
    }
}
