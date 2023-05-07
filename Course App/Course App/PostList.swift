//
//  PostList.swift
//  Course App
//
//  Created by SKUBI on 15/04/23.
//

import SwiftUI

struct PostList: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title).bold()
                Text(post.body)
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
