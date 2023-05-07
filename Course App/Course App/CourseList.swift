//
//  CourseList.swift
//  Course App
//
//  Created by SKUBI on 10/04/23.
//

import SwiftUI

struct CourseList: View {
    @ObservedObject var store = CourseStore()
    @State var show = false
    @State var active = false
    @State var activeIndex = -1
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.black.opacity(0.001)
                .ignoresSafeArea()
                .animation(.linear, value: show)

                
                VStack(spacing: 30) {
                    
                    Text ("Courses")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding (.leading, 30) .padding (.top, 30)
                        .blur(radius: active ? 20: 0)
                    
                    ForEach(store.courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: $store.courses[index].show,
                                       course: store.courses[index],
                                       active: $active,
                                       index: index,
                                       activeIndex: $activeIndex)
                            .offset(y: store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                //.scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                        }
                        .frame(height: store.courses[index].show ? screen.width : 280)
                        .frame(maxWidth: store.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.store.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
            }
        }
        .statusBar(hidden: true)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
   // @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOs. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                     
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help yournavigate the issues you might encounter.")
            }
            .padding()
            //.padding(.top, 50)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 290, alignment: .top)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: show ? 460 : 0)
            //.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity (show ? 1 : 0)

            
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(course.title)
                            .font(.system(size: show ? 30 : 24))
                            .bold()
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    ZStack {
                        Image(course.logo)
                            .opacity(show ? 0 : 1)
                        
                        Image(systemName: "xmark")
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Circle())
                            .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                
                Image(course.image)
                    .resizable()
                    .scaledToFit()
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            //.frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height - 44 : 260)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            .background(Color(course.color))
            .cornerRadius(30)
            .shadow(color: Color(course.color).opacity(0.5), radius: 20, x: 0,y: 20)
//            .gesture(
//                DragGesture().onChanged {value in
//                    self.activeView = value.translation
//                }
//                    .onEnded{value in
//                        if self.activeView.height > 50 {
//                            show = false
//                            active = false
//                            activeIndex = -1
//                        }
//                        self.activeView = .zero
//                    }
//            )
            
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if show {
                    activeIndex = index
                } else {
                    activeIndex = -1
                }
            }
            if show {
                CourseDetail(show: $show, active: $active, activeIndex: $activeIndex, course: course)
                    .background(Color.white)
                    .animation(nil, value: show)
            }
        }
        .frame(height: show ? screen.height : 280)
        //.scaleEffect(1 - self.activeView.width / 1000)
        //.rotation3DEffect(Angle(degrees: Double(activeView.height / 10)), axis: (x: 0, y: 10, z: 0))
        //.hueRotation(Angle(degrees: activeView.height))
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: show)
        .ignoresSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var logo: String
    var color: String
    var show: Bool
}


let courseData = [
    Course(title: "Prototype design in SwiftUI", subtitle: "18 Sections",image: "Card1", logo: "Logo1", color: "card1", show: false),
    Course(title: "SwiftUI Advanced", subtitle: "24 Sections", image: "Card2", logo: "Logo2", color: "card2", show: false),
    Course(title: "UI Designs for Developers", subtitle: "10 Sections", image: "Card3", logo: "Logo3", color: "card3", show: false)
]
