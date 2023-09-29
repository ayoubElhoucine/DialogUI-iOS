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
                .zIndex(0)
            if show {
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black.opacity(0.4))
                    .animation(.default, value: self.show)
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                            self.show = false
                        }
                    }
                contentView()
                    .zIndex(2)
                    .transition(AnyTransition.scale(scale: .zero).combined(with: .opacity))
                    
            }
        }
    }
}


