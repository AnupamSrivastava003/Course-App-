//
//  BlurView.swift
//  Course App
//
//  Created by SKUBI on 16/04/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect (style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
        blurView.widthAnchor.constraint (equalTo: view.widthAnchor),
        blurView.heightAnchor.constraint (equalTo: view.heightAnchor)
        ])
        return view

    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
//    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> some UIView {
//        <#code#>
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<BlurView>) {
//        <#code#>
//    }
}
