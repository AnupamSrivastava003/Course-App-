//
//  CourseDetail.swift
//  Course App
//
//  Created by SKUBI on 15/04/23.
//

import SwiftUI

struct CourseDetail: View {
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var course: Course
    var body: some View {
        ScrollView {
            VStack {
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
                            Image(systemName: "xmark")
                                .padding(12)
                                .foregroundColor(.white)
                                .background(Circle())
                                .onTapGesture {
                                    show = false
                                    active = false
                                    activeIndex = -1
                                }
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
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOs. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                         
                    Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help yournavigate the issues you might encounter.")
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(show: .constant(true),  active: .constant(true), activeIndex: .constant(-1), course: courseData[0])
    }
}
