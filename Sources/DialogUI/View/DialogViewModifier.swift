//
//  File.swift
//  
//
//  Created by Ayoub on 29/9/2023.
//

import Foundation
import SwiftUI



public struct DialogViewModifier<ContentView: View>: ViewModifier {
    
    
    @ViewBuilder private var contentView: () -> ContentView
    @Binding private var show: Bool
    
    public init(content: @escaping () -> ContentView, show: Binding<Bool>) {
        self.contentView = content
        self._show = show
    }
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
            if show {
                Spacer()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(.black.opacity(0.4))
                    .animation(.default, value: self.show)
                    .onTapGesture {
                        self.show = false
                    }
                contentView()
                    .animation(.easeInOut)
                    .transition(AnyTransition.scale(scale: .zero).combined(with: .opacity))
                    
            }
        }
    }
}


