//
//  MenuView.swift
//  Course App
//
//  Created by SKUBI on 02/04/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                
                Text("Anupam - 36% Completed")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                //.offset(x: -37)
                    .frame(width: 120, height: 6,alignment: .leading)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    .frame(width: 135, height: 20)
                    .background(.black.opacity(0.1))
                    .cornerRadius(20)
                
                MenuRow(title: "Account", image: "gear")
                MenuRow(title: "Billing", image: "creditcard")
                MenuRow(title: "Log out", image: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            //.shadow(radius: 50, y: 20)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .offset(y: -167)
            )}
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var image: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(.gray)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)

        }
    }
}
