//
//  Buttons.swift
//  Course App
//
//  Created by SKUBI on 18/04/23.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Text("Button")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        Color.white
                            .cornerRadius(20)
                            .blur(radius: 4)
                            .offset (x: -8, y: -8)

                            .cornerRadius(20)
                        
                        RoundedRectangle (cornerRadius: 16, style:
                        .continuous)
                            .fill(
                                LinearGradient (gradient: Gradient (colors: [Color.blue.opacity(0.15), Color.white]), startPoint:
                                    .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur (radius: 2)
                    }
                )
                .cornerRadius(20)
                .shadow(color: .blue.opacity(0.2), radius: 20, x: 20, y: 20)
                .shadow(color: .white, radius: 20, x: -20, y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.12))
        .ignoresSafeArea()
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
