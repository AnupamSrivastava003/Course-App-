//
//  CourseStore.swift
//  Course App
//
//  Created by SKUBI on 16/04/23.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "h183gw78kbdp", accessToken: "X9o_fGZaVo_CMoha8F7t7viVl_i1Evs_HKaN6sYu8Fw")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    client.fetchArray(of: Entry.self, matching: query) {result in
        switch result {
        case .success(let array):
            completion(array.items)
        case .failure(let error):
            print(error)
        }
        
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init(){
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: "Card1",
                    logo: "Logo1",
                    color: "card1",
                    show: false))
            }
        }
    }
}
