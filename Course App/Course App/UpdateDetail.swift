//
//  UpdateDetail.swift
//  Course App
//
//  Created by SKUBI on 03/04/23.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity)
            }
            .navigationTitle(update.title)
        }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
