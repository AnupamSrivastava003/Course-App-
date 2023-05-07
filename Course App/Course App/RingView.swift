//
//  RingView.swift
//  Course App
//
//  Created by SKUBI on 04/04/23.
//

import SwiftUI

struct RingView: View {
    var color1 = Color(.red)
    var color2 = Color(.systemIndigo)
    var height: CGFloat = 88
    var width: CGFloat = 88
    var percent: CGFloat = 55
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5 * multiplier))
                .foregroundColor(Color.black).opacity(0.1)
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, dash: [20, 0]
                                          )
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            
                .frame(width: width, height: height)
                .shadow(color: Color.indigo.opacity(0.3), radius: 5, x: 0, y: 5 * multiplier)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .bold()
                .onTapGesture {
                    self.show.toggle()
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
